resource "kubernetes_manifest" "postgres_deployment" {
  provider = kubernetes
  manifest = yamldecode(file("${path.module}/../k8s/postgres-deployment.yaml"))

  depends_on = [google_container_cluster.primary]
}

resource "kubernetes_manifest" "postgres_service" {
  provider = kubernetes
  manifest = yamldecode(file("${path.module}/../k8s/postgres-service.yaml"))

  depends_on = [google_container_cluster.primary]
}
