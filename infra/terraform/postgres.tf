resource "kubernetes_manifest" "postgres_deployment" {
  manifest = yamldecode(file("${path.module}/../k8s/postgres-deployment.yaml"))
}

resource "kubernetes_manifest" "postgres_service" {
  manifest = yamldecode(file("${path.module}/../k8s/postgres-service.yaml"))
}
