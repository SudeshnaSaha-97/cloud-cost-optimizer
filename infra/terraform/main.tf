# Cluster module
module "cluster" {
  source = "./cluster"

  project_id             = var.project_id
  region                 = var.region
  zone                   = var.zone
  cluster_name           = var.cluster_name
  frontend_pool_size     = var.frontend_pool_size
  backend_pool_size      = var.backend_pool_size
  postgres_pool_size     = var.postgres_pool_size
  enable_postgres_node   = var.enable_postgres_node
  enable_cloudsql_postgres = var.enable_cloudsql_postgres
  enable_jenkins_vm      = var.enable_jenkins_vm
  service_account        = var.service_account
}

# Workloads module
module "workloads" {
  source = "./workloads"
  depends_on = [module.cluster]

  providers = {
    google     = google
    kubernetes = kubernetes
    helm       = helm
  }

  project_id             = var.project_id
  enable_postgres_node   = var.enable_postgres_node
  enable_cloudsql_postgres = var.enable_cloudsql_postgres

  # Pass cluster outputs
  gke_endpoint           = module.cluster.gke_endpoint
  gke_ca_certificate     = module.cluster.gke_ca_certificate
  cloudsql_connection_name = module.cluster.cloudsql_connection_name
  cloudsql_db_name       = var.cloudsql_db_name
  cloudsql_db_password   = var.cloudsql_db_password
  cloudsql_db_user       = var.cloudsql_db_user
  gcp_service_account_json = var.gcp_service_account_json
  postgres_db            = var.postgres_db
  postgres_password      = var.postgres_password
  postgres_user          = var.postgres_user
}
