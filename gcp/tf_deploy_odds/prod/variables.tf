# Variables
# 
# Input variables allow you to customize modules without altering their source code.
#================================================

variable "gcp_creds" {
  description = "GCP Credentials."
  default     = ""
}

variable "location" {
  description = "Region in which to deploy infrastructure."
  default     = "US"
}

variable "project" {
  description = "Google Cloud Project that isolates this environment's infrastructure."
  default     = "bellanov-1732683524"
}

variable "region" {
  description = "Region in which to deploy infrastructure."
  default     = "us-east1"
}

variable "terraform_identity" {
  description = "Terraform Service Account."
  default     = "terraform"
}

variable "zone" {
  description = "Zone in which to deploy infrastructure."
  default     = "us-east1-b"
}