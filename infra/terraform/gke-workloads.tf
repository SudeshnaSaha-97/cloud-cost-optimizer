resource "kubernetes_manifest" "backend_deployment" {
  manifest   = yamldecode(file("${path.module}/../k8s/backend-deployment.yaml"))
  depends_on = [google_container_cluster.primary]
}

resource "kubernetes_manifest" "backend_service" {
  manifest   = yamldecode(file("${path.module}/../k8s/backend-service.yaml"))
  depends_on = [google_container_cluster.primary]
}

resource "kubernetes_manifest" "frontend_deployment" {
  manifest   = yamldecode(file("${path.module}/../k8s/frontend-deployment.yaml"))
  depends_on = [google_container_cluster.primary]
}

resource "kubernetes_manifest" "frontend_service" {
  manifest   = yamldecode(file("${path.module}/../k8s/frontend-service.yaml"))
  depends_on = [google_container_cluster.primary]
}

resource "kubernetes_ingress_v1" "cloud_cost_ingress" {
  metadata {
    name      = "cloud-cost-ingress"
    namespace = "default"
    annotations = {
      "kubernetes.io/ingress.class" = "gce"
    }
  }

  spec {
    rule {
      http {
        path {
          path      = "/api/*"
          path_type = "ImplementationSpecific"
          backend {
            service {
              name = "backend-service"
              port { number = 8000 }
            }
          }
        }
        path {
          path      = "/"
          path_type = "Prefix"
          backend {
            service {
              name = "frontend-service"
              port { number = 80 }
            }
          }
        }
      }
    }
  }

  depends_on = [
    kubernetes_manifest.backend_service,
    kubernetes_manifest.frontend_service
  ]
}

resource "null_resource" "ingress_ip_fetch" {
  provisioner "local-exec" {
    environment = {
      KUBECONFIG = "${path.module}/../kubeconfig"
    }
    command = <<EOT
    kubectl get ingress cloud-cost-ingress -n default -o jsonpath='{.status.loadBalancer.ingress[0].ip}' > ingress_ip.txt
  EOT
    interpreter = ["/bin/bash", "-c"]
  }

  depends_on = [kubernetes_ingress_v1.cloud_cost_ingress]
}

resource "kubernetes_manifest" "cloudsql_proxy_patch" {
  count      = var.enable_cloudsql_postgres ? 1 : 0
  manifest   = yamldecode(file("${path.module}/../k8s/cloudsql-proxy.yaml"))
  depends_on = [google_container_cluster.primary]
}
