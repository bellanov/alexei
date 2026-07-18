# 'PUTER

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
      name = "gcp_deploy_puter"
    }
  }
}

provider "google" {
  project     = var.project
  region      = var.region
  zone        = var.zone
  credentials = var.gcp_creds
}

# Modules
#
# Any possibility of reusing infrastructure is attempted here.
#================================================

module "storage" {
  source   = "bellanov/storage/google"
  version  = "0.1.1"
  buckets  = local.storage.buckets
  project  = var.project
  location = var.location
}

# Locals
#
# Area to constrain / harness various configurations to modules / resources. 
#================================================

locals {

  # Storage Module Configuration
  storage = {
    # Artifact Registries
    "artifact_registries" : {

    },
    # Storage Buckets
    "buckets" : {

    }
  }

  environments = {
    # Development
    "dev" : {

    },
    # Quality Assurance
    "qa" : {

    },
    # Production
    "prod" : {

    }
  }
}
