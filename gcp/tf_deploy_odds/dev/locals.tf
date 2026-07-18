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