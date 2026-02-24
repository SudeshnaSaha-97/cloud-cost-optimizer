variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "GCP zone"
  type        = string
  default     = "us-central1-a"
}

variable "cluster_name" {
  description = "Name of the GKE cluster"
  type        = string
  default     = "cloud-cost-cluster"
}

variable "frontend_repo" {
  description = "Artifact Registry repo for frontend"
  type        = string
  default     = "frontend-repo"
}

variable "backend_repo" {
  description = "Artifact Registry repo for backend"
  type        = string
  default     = "backend-repo"
}

variable "enable_jenkins_vm" {
  description = "Whether to provision Jenkins VM"
  type        = bool
  default     = false
}

variable "enable_cloudsql_postgres" {
  description = "Whether to provision Cloud SQL Postgres"
  type        = bool
  default     = false
}


