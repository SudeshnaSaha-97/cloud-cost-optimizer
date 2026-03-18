/*terraform {
  required_version = ">= 1.5.0"
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "~> 5.45"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "~> 2.20"
    }
    helm = {
      source = "hashicorp/helm"
      version = "~> 2.11"
    }
  }
  backend "gcs" {
    bucket = "cloud-cost-optimizer-tfstate"
    prefix = "terraform/state/workloads"
  }
} */

provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

data "google_client_config" "default" {}

provider "kubernetes" {
  host                   = "https://${var.gke_endpoint}"
  cluster_ca_certificate = base64decode(var.gke_ca_certificate)
  token                  = data.google_client_config.default.access_token
}

provider "helm" {
  kubernetes {
    host                   = "https://${var.gke_endpoint}"
    cluster_ca_certificate = base64decode(var.gke_ca_certificate)
    token                  = data.google_client_config.default.access_token
  }
}
