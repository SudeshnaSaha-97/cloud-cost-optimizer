terraform {
  backend "gcs" {
    bucket = "cloud-cost-optimizer-tfstate"
    prefix = "terraform/state/cluster"
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

