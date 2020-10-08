terraform {
  required_version = "~> 0.12"
}

provider "random" {
  version = "~> 2.1"
}

provider "google" {
  version = "~> 3.5"
  project = var.gcp_project_id
  region  = local.gcp_region
}
provider "google-beta" {
  version = "~> 3.5"
  project = var.gcp_project_id
  region  = local.gcp_region
}

