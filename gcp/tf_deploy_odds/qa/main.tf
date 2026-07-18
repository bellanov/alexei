# Bellanov L.L.C.

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
      name = "gcp_deploy_bellanov"
    }
  }
}

provider "google" {
  project     = var.project
  region      = var.region
  zone        = var.zone
  credentials = var.gcp_creds
}

# Data Sources
# 
# Retrieve information about existing state programatically.
#================================================

# Cloud Build Identity
#
# Example data source to retrieve existing resource information programatically.
#
# data "google_service_account" "cloudbuild" {
#   account_id = "cloudbuild-identity"
# }

# Terraform Identity
data "google_service_account" "terraform" {
  account_id = var.terraform_identity
}

# Modules
#
# Any possibility of reusing infrastructure is attempted here.
#================================================

module "identity" {
  source             = "bellanov/identity/google"
  version            = "0.1.0"
  project            = var.project
  service_accounts   = local.identity.service_accounts
  terraform_identity = data.google_service_account.terraform.member
}

module "role" {
  source          = "bellanov/role/google"
  version         = "0.1.0"
  for_each        = local.role.service_accounts
  project         = var.project
  service_account = each.value.email
  roles           = each.value.roles

  depends_on = [
    module.identity
  ]
}

module "storage" {
  source              = "bellanov/storage/google"
  version             = "0.1.1"
  artifact_registries = local.storage.artifact_registries
  buckets             = local.storage.buckets
  project             = var.project
  location            = var.location
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

  # Identity Module Configuration
  identity = {
    # Service Accounts
    "service_accounts" : {
      # Example configuration for a Cloud Build service account is defined below. The account
      # is then assigned roles via the Role module.
      #
      #    The fully qualified service account name is required here.
      #    It can be manually input initially and later hardened with a data source.
      #   
      #      Examples:
      #        "service_account" : "projects/${var.project}/serviceAccounts/cloudbuild-identity@${var.project}.iam.gserviceaccount.com",
      #        "service_account" : data.google_service_account.cloudbuild.id
      #
      # "cloudbuild" : {
      #   "display_name" : "Cloud Build User.",
      #   "service_account" : "projects/${var.project}/serviceAccounts/cloudbuild-identity@${var.project}.iam.gserviceaccount.com"
      # }
    }
  }

  # Role Module Configuration
  role = {
    # Service Accounts
    "service_accounts" : {
      # Consume values from the Identity module and assign the configued roles.
      #
      # "cloudbuild" : {
      #   "email" : module.identity.service_accounts["cloudbuild-identity"]["email"],
      #   "service_account" : module.identity.service_accounts["cloudbuild-identity"]["id"],
      #   "roles" : [
      #     "roles/artifactregistry.writer",
      #     "roles/cloudbuild.builds.editor",
      #     "roles/logging.logWriter",
      #     "roles/storage.admin",
      #   ]
      # }
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