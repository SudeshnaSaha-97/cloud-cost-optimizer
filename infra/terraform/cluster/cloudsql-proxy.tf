resource "google_sql_database_instance" "postgres" {
  count    = var.enable_cloudsql_postgres ? 1 : 0
  name     = "cloudsql-postgres"
  region   = var.region
  database_version = "POSTGRES_14"

  settings {
    tier = "db-f1-micro"
    ip_configuration {
      ipv4_enabled = true
      authorized_networks {
        name  = "default"
        value = "0.0.0.0/0"
      }
    }
  }
}

resource "google_sql_user" "postgres_user" {
  count    = var.enable_cloudsql_postgres ? 1 : 0
  name     = "appuser"
  instance = google_sql_database_instance.postgres[0].name
  password = "securepassword123"
}
