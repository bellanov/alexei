# Variables
# 
# Input variables allow you to customize modules without altering their source code.
#================================================

variable "access_key" {
  description = "Access Key"
  type        = string
  default     = ""
}

variable "region" {
  description = "Region where resources will be procured."
  type        = string
  default     = "us-west-1"
}

variable "secret_key" {
  description = "Secret Key."
  default     = ""
}
