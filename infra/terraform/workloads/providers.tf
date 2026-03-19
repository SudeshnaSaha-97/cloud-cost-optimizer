data "terraform_remote_state" "cluster" {
  backend = "gcs"
  config = {
    bucket = "cloud-cost-optimizer-tfstate"
    prefix = "terraform/state/cluster"
  }
}

data "google_client_config" "default" {}

provider "kubernetes" {
  host                   = "https://${data.terraform_remote_state.cluster.outputs.gke_endpoint}"
  cluster_ca_certificate = base64decode(data.terraform_remote_state.cluster.outputs.gke_ca_certificate)
  token                  = data.google_client_config.default.access_token
}

provider "helm" {
  kubernetes {
    host                   = "https://${data.terraform_remote_state.cluster.outputs.gke_endpoint}"
    cluster_ca_certificate = base64decode(data.terraform_remote_state.cluster.outputs.gke_ca_certificate)
    token                  = data.google_client_config.default.access_token
  }
}
