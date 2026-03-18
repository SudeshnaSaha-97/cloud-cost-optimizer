resource "helm_release" "frontend" {
  name      = "frontend"
  chart     = "${path.module}/../../helm/frontend"
  namespace = "default"
}

resource "helm_release" "backend" {
  name      = "backend"
  chart     = "${path.module}/../../helm/backend"
  namespace = "default"
}

resource "helm_release" "postgres" {
  count     = var.enable_postgres_node ? 1 : 0
  name      = "postgres"
  chart     = "${path.module}/../../helm/postgres"
  namespace = "default"
}

resource "helm_release" "cloudsql_proxy" {
  count     = var.enable_cloudsql_postgres ? 1 : 0
  name      = "cloudsql-proxy"
  chart     = "${path.module}/../../helm/cloudsql-proxy"
  namespace = "default"
  set {
    name  = "cloudsql.instance"
    value = var.cloudsql_connection_name
  }
}

