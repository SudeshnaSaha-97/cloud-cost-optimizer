output "gke_cluster_name" {
  value       = google_container_cluster.primary.name
  description = "Name of the GKE cluster"
}

output "gke_endpoint" {
  value       = google_container_cluster.primary.endpoint
  description = "Endpoint of the GKE cluster"
}

output "gke_ca_certificate" {
  value       = google_container_cluster.primary.master_auth[0].cluster_ca_certificate
  description = "The cluster CA certificate"
  sensitive   = true
}

output "gke_cluster_location" {
  value       = google_container_cluster.primary.location
  description = "Location/zone of the GKE cluster"
}

output "jenkins_vm_ip" {
  value       = try(google_compute_instance.jenkins_vm[0].network_interface[0].access_config[0].nat_ip, "")
  description = "Public IP of Jenkins VM (empty if disabled)"
}

output "cloudsql_connection_name" {
  value       = try(google_sql_database_instance.postgres[0].connection_name, "")
  description = "Connection string for Cloud SQL Postgres (empty if disabled)"
}

output "cloudsql_instance_name" {
  value       = try(google_sql_database_instance.postgres[0].name, "")
  description = "Cloud SQL instance name (empty if disabled)"
}

output "backend_repo_url" {
  value = "us-central1-docker.pkg.dev/${var.project_id}/backend-repo/backend:latest"
}

output "frontend_repo_url" {
  value = "us-central1-docker.pkg.dev/${var.project_id}/frontend-repo/frontend:latest"
}
