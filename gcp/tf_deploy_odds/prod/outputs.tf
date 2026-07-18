# Outputs
# 
# Output values make information about your infrastructure available on the command line, 
# and can expose information for other Terraform configurations to use.
#================================================

output "identity" {
  description = "Service Accounts."
  value       = module.identity
}

output "role" {
  description = "Role Module."
  value       = module.role
}

output "storage" {
  description = "Storage Module."
  value       = module.storage
}