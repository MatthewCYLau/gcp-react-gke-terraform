terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.77.0"
    }
  }
}

terraform {
  backend "gcs" {
    bucket = "react-gke-tf-state"
    prefix = "terraform/state"
  }
}

provider "google" {
  region                      = var.region
  zone                        = var.zone
  project                     = var.project
  credentials                 = var.creds
}