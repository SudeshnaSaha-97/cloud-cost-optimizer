variable "project_id" {
  type = string
}

variable "service_account" {
  type = string
}

variable "region" {
  type = string
  default = "us-central1"
}

variable "zone" {
  type = string
  default = "us-central1-a"
}

variable "cluster_name" {
  type = string
  default = "cloud-cost-cluster"
}

variable "frontend_pool_size" {
  type = number
  default = 2
}

variable "backend_pool_size" {
  type = number
  default = 2
}

variable "postgres_pool_size" {
  type = number
  default = 1
}

variable "enable_postgres_node" {
  type = bool
}

variable "enable_cloudsql_postgres" {
  type = bool
}

variable "enable_jenkins_vm" {
  type = bool
}

# Sensitive variables
variable "cloudsql_db_user" {
  type = string
}

variable "cloudsql_db_password" {
  type = string
  sensitive = true
}

variable "cloudsql_db_name" {
  type = string
}

variable "gcp_service_account_json" {
  type = string
  sensitive = true
}

variable "postgres_user" {
  type = string
}

variable "postgres_password" {
  type = string
  sensitive = true
}

variable "postgres_db" {
  type = string
}
