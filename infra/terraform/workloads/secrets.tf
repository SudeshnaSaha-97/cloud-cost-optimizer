resource "kubernetes_secret" "cloudsql_db_credentials" {
  metadata {
    name      = "cloudsql-db-credentials"
    namespace = "default"
  }

  data = {
    username = base64encode(var.cloudsql_db_user)
    password = base64encode(var.cloudsql_db_password)
    database = base64encode(var.cloudsql_db_name)
  }

  type = "Opaque"
}

resource "kubernetes_secret" "gcp_service_account" {
  metadata {
    name      = "gcp-service-account"
    namespace = "default"
  }

  data = {
    "service-account.json" = base64encode(var.gcp_service_account_json)
  }

  type = "Opaque"
}

resource "kubernetes_secret" "postgres_secret" {
  metadata {
    name      = "postgres-secret"
    namespace = "default"
  }

  data = {
    username = base64encode(var.postgres_user)
    password = base64encode(var.postgres_password)
    database = base64encode(var.postgres_db)
  }

  type = "Opaque"
}
