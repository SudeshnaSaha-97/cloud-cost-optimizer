output "gke_endpoint" {
  value     = google_container_cluster.primary.endpoint
  sensitive = true
}

output "gke_ca_certificate" {
  value     = google_container_cluster.primary.master_auth[0].cluster_ca_certificate
  sensitive = true
}

output "gke_cluster_name" {
  value = google_container_cluster.primary.name
}

output "gke_cluster_location" {
  value = google_container_cluster.primary.location
}

output "jenkins_vm_ip" {
  value       = try(google_compute_instance.jenkins_vm[0].network_interface[0].access_config[0].nat_ip, "")
  description = "Public IP of Jenkins VM (empty if disabled)"
}

output "postgres_pool_status" {
  value       = var.enable_postgres_node ? "enabled" : "disabled"
}

output "cloudsql_proxy_status" {
  value       = var.enable_cloudsql_proxy ? "enabled" : "disabled"
}

