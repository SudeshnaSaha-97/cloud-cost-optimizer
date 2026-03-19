terraform {
  backend "gcs" {
    bucket = "cloud-cost-optimizer-tfstate"
    prefix = "terraform/state/workloads"
  }
}

data "terraform_remote_state" "cluster" {
  backend = "gcs"
  config = {
    bucket = "cloud-cost-optimizer-tfstate"
    prefix = "terraform/state/cluster"
  }
}


