# Alexei

# Providers
# 
# Things to simply keep up-to-date. Provides access to new resource types.
#================================================

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.31.0"
    }
  }

  cloud {
    organization = "bellanov"
    workspaces {
      name = "aws_deploy_alexei"
    }
  }
}

provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.region
}

# Modules
#
# Any possibility of reusing "resource {}" blocks is attempted here.
#================================================

module "storage" {
  source              = "bellanov/storage/aws"
  version             = "0.1.1"
  artifact_registries = local.storage.artifact_registries
  buckets             = local.storage.buckets
}

# Locals
#
# Area to constrain / harness various configurations to modules / resources. 
#================================================

locals {

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
    "dev" : {},
    # Quality Assurance
    "qa" : {},
    # Production
    "prod" : {}
  }
}
