terraform {
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
    prefix = "terraform/state/root"
  }
}