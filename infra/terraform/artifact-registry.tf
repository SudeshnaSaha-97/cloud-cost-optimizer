resource "google_artifact_registry_repository" "frontend_repo" {
  provider      = google
  project       = var.project_id
  location      = var.region
  repository_id = var.frontend_repo
  description   = "Frontend Docker images"
  format        = "DOCKER"
}

resource "google_artifact_registry_repository" "backend_repo" {
  provider      = google
  project       = var.project_id
  location      = var.region
  repository_id = var.backend_repo
  description   = "Backend Docker images"
  format        = "DOCKER"
}

