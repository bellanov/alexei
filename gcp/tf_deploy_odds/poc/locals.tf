# Locals
#
# Area to constrain / harness various configurations to modules / resources. 
#================================================

locals {

  # Storage Module Configuration
  storage = {
    # Storage Buckets
    "buckets" : {
      "odds-data-samples" : {
        "public_access_prevention" : "inherited",
      }
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
      #   
      #      Examples:
      #
      #         "cloudbuild" : {
      #           "display_name" : "Cloud Build User.",
      #           "service_account" : "projects/${var.project}/serviceAccounts/cloudbuild-identity@${var.project}.iam.gserviceaccount.com"
      #         }
      "fantasy-functions" : {
        "display_name" : "FantasyAce Cloud Functions.",
        # The fully qualified service account name is required here.
        "service_account" : "projects/${var.project}/serviceAccounts/fantasy-functions-identity@${var.project}.iam.gserviceaccount.com"
      }
    }
  }

  # Role Module Configuration
  role = {
    # Service Accounts
    "service_accounts" : {
      # Consume values from the Identity module and assign the configued roles.
      "fantasy-functions-identity" : {
        "email" : module.identity.service_accounts["fantasy-functions-identity"]["email"],
        "service_account" : module.identity.service_accounts["fantasy-functions-identity"]["id"],
        "roles" : [
          # Provides read access to Firebase resources.
          "roles/firebase.viewer",
        ]
      }
    }
  }

}