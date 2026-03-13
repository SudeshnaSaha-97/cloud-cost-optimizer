resource "kubernetes_manifest" "postgres_deployment" {
  count = var.enable_postgres_node ? 1 : 0
  provider = kubernetes
  manifest = yamldecode(file("${path.module}/../k8s/postgres-deployment.yaml"))

  depends_on = [google_container_cluster.primary]
}

resource "kubernetes_manifest" "postgres_service" {
  count = var.enable_postgres_node ? 1 : 0
  provider = kubernetes
  manifest = yamldecode(file("${path.module}/../k8s/postgres-service.yaml"))

  depends_on = [google_container_cluster.primary]
}
