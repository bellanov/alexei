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