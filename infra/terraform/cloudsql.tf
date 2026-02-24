resource "google_sql_database_instance" "postgres" {
  count            = var.enable_cloudsql_postgres ? 1 : 0
  name             = "cloud-cost-postgres"
  database_version = "POSTGRES_14"
  region           = var.region
  project          = var.project_id

  settings {
    tier = "db-f1-micro"   # cost-optimized tier for MVP
    backup_configuration {
      enabled = true
    }
    ip_configuration {
      ipv4_enabled    = true
      ssl_mode     = "ALLOW_UNENCRYPTED_AND_ENCRYPTED"  # allows both encrypted and unencrypted connections
      authorized_networks {
        name  = "default"
        value = "0.0.0.0/0" # allow external for MVP, restrict later
      }
    }
  }
}

resource "google_sql_database" "app_db" {
  count    = var.enable_cloudsql_postgres ? 1 : 0
  name     = "appdb"
  instance = google_sql_database_instance.postgres[0].name
  project  = var.project_id
}

resource "google_sql_user" "app_user" {
  count    = var.enable_cloudsql_postgres ? 1 : 0
  name     = "appuser"
  instance = google_sql_database_instance.postgres[0].name
  password = "StrongPassword123!"   # replace with Secret Manager later
  project  = var.project_id
}



