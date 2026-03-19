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
  description = "Number of nodes in postgres pool"
  type        = number
  default     = 2
}

variable "enable_jenkins_vm" {
  description = "Enable Jenkins VM for CI/CD"
  type        = bool
  default     = false
}

variable "enable_cloudsql_proxy" {
  description = "Enable Cloud SQL proxy sidecar"
  type        = bool
  default     = false
}

variable "enable_postgres_node" {
  description = "Enable dedicated Postgres node pool"
  type        = bool
  default     = false
}
