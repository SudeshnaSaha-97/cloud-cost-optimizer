/*terraform {
  required_version = ">= 1.5.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.45"
    }
  }

  backend "gcs" {
    bucket = "cloud-cost-optimizer-tfstate"
    prefix = "terraform/state/cluster"
  }
} */

provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

data "google_client_config" "default" {}
