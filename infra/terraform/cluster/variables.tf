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

variable "frontend_pool_size" {
  description = "Number of nodes in frontend pool"
  type        = number
  default     = 2
}

variable "backend_pool_size" {
  description = "Number of nodes in backend pool"
  type        = number
  default     = 2
}

variable "postgres_pool_size" {
  description = "Number of nodes in Postgres pool"
  type        = number
  default     = 1
}

variable "enable_postgres_node" {
  description = "Enable local Postgres node pool"
  type        = bool
  default     = false
}

variable "enable_cloudsql_postgres" {
  description = "Enable Cloud SQL Postgres + proxy"
  type        = bool
  default     = false
}

variable "enable_jenkins_vm" {
  description = "Enable Jenkins VM"
  type        = bool
  default     = false
}
