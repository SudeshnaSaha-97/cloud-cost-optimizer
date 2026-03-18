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

variable "cloudsql_db_user" {
  description = "Username of Cloud SQL"
  type = string
}

variable "cloudsql_db_password" {
  description = "Password of Cloud SQL"
  type = string
  sensitive = true
}

variable "cloudsql_db_name" {
  description = "Database name of Cloud SQL"
  type = string
}

variable "gcp_service_account_json" {
  description = "GCP Service Account"
  type = string
  sensitive = true
}

variable "postgres_user" {
  description = "Username of Postgres"
  type = string
}
variable "postgres_password" {
  description = "Password of Postgres"
  type = string
  sensitive = true
}
variable "postgres_db" {
  description = "Database name of Postgres"
  type = string
}

variable "gke_endpoint" {
  type = string
}

variable "gke_ca_certificate" {
  type = string
}

variable "cloudsql_connection_name" {
  type = string
}

