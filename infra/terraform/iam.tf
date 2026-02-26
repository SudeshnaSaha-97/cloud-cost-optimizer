# Allow CI/CD service account to push images
resource "google_project_iam_member" "ci_cd_artifact_registry" {
  project = var.project_id
  role    = "roles/artifactregistry.writer"
  member  = "serviceAccount:${var.service_account}"
}

# Allow CI/CD service account to deploy to GKE
resource "google_project_iam_member" "ci_cd_gke_deploy" {
  project = var.project_id
  role    = "roles/container.admin"
  member  = "serviceAccount:${var.service_account}"
}
 
variable "service_account" {
  description = "Service account email used by CI/CD pipelines"
  type        = string
}

