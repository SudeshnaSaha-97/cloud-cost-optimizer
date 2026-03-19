resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.zone
  project  = var.project_id

  remove_default_node_pool = true
  initial_node_count       = 1

  networking_mode = "VPC_NATIVE"

  ip_allocation_policy {}

  release_channel {
    channel = "REGULAR"
  }

  deletion_protection = false

  master_auth {
    client_certificate_config {
      issue_client_certificate = false
    }
  }
}

resource "google_container_node_pool" "frontend_pool" {
  name       = "frontend-pool"
  cluster    = google_container_cluster.primary.name
  location   = var.zone
  node_count = var.frontend_pool_size

  node_config {
    machine_type = "e2-medium"
    oauth_scopes = ["https://www.googleapis.com/auth/cloud-platform"]
    labels = {
      role = "frontend"
    }
  }
}

resource "google_container_node_pool" "backend_pool" {
  name       = "backend-pool"
  cluster    = google_container_cluster.primary.name
  location   = var.zone
  node_count = var.backend_pool_size

  node_config {
    machine_type = "e2-medium"
    oauth_scopes = ["https://www.googleapis.com/auth/cloud-platform"]
    labels = {
      role = "backend"
    }
  }
}


