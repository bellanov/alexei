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
  source   = "bellanov/storage/google"
  version  = "0.1.1"
  buckets  = local.storage.buckets
  project  = var.project
  location = var.location
}
