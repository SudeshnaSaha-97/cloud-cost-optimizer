resource "google_container_node_pool" "postgres_pool" {
  count      = var.enable_postgres_node ? 1 : 0
  name       = "${var.cluster_name}-postgres-pool"
  cluster    = google_container_cluster.primary.name
  location   = var.region
  node_count = var.postgres_pool_size

  node_config {
    machine_type = "e2-small"
    oauth_scopes = ["https://www.googleapis.com/auth/cloud-platform"]
    labels = {
      role = "postgres"
    }
  }
}