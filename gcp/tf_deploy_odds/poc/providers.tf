# Providers
# 
# Things to simply keep up-to-date. Provides access to new resource types.
#================================================

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.50.0"
    }
  }

  cloud {
    organization = "bellanov"
    workspaces {
      name = "gcp_deploy_odds_poc"
    }
  }
}

provider "google" {
  project     = var.project
  region      = var.region
  zone        = var.zone
  credentials = var.gcp_creds
}