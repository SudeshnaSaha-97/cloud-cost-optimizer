output "frontend_status" {
  value = helm_release.frontend.status
  description = "Status of Frontend"
}

output "backend_status" {
  value = helm_release.backend.status
  description = "Status of Backend"
}

output "postgres_status" {
  value = try(helm_release.postgres[0].status, "")
  description = "Status of Postgres"
}

output "cloudsql_proxy_status" {
  value = try(helm_release.cloudsql_proxy[0].status, "")
  description = "Status of Cloud SQL Proxy"
}
