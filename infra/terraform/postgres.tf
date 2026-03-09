resource "kubernetes_manifest" "postgres_deployment" {
  count    = var.enable_postgres_node ? 1 : 0
  manifest = yamldecode(file("${path.module}/../k8s/postgres-deployment.yaml"))
}

resource "kubernetes_manifest" "postgres_service" {
  count    = var.enable_postgres_node ? 1 : 0
  manifest = yamldecode(file("${path.module}/../k8s/postgres-service.yaml"))
}

