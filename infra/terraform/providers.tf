terraform {
  required_version = ">= 1.5.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
  backend "gcs" {
    bucket = "cloud-cost-optimizer-tfstate"
    prefix = "terraform/state"
  }
}

# Google provider
provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

# Get current GCP client config (access token, project, etc.)
data "google_client_config" "default" {}

# Kubernetes provider configured with GKE cluster credentials
provider "kubernetes" {
  host                   = google_container_cluster.primary.endpoint
  cluster_ca_certificate = base64decode(google_container_cluster.primary.master_auth[0].cluster_ca_certificate)
  token                  = data.google_client_config.default.access_token

  # Ensure provider waits until cluster is created
  load_config_file       = false

  depends_on = [google_container_cluster.primary]
}

provider "http" {

}
