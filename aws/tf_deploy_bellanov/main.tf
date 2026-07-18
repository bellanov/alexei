# Bellanov L.L.C.

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
      name = "aws_deploy_bellanov"
    }
  }
}

provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.region
}

# Data Sources
# 
# Data sources allow Terraform to use information defined outside of Terraform, defined
# by another separate Terraform configuration, or modified by functions.
#================================================

# CodeBuild Role Policy
data "aws_iam_policy_document" "codebuild" {

  statement {
    effect    = "Allow"
    actions   = ["codebuild:*"]
    resources = ["*"]
  }

  statement {
    effect = "Allow"
    actions = [
      "s3:GetObject",
      "s3:List*",
      "s3:PutObject",
      "s3:GetBucketAcl",
      "s3:GetBucketLocation"
    ]
    resources = ["*"]
  }

}

# Modules
#
# Modules are containers for multiple resources that are used together.
#================================================

module "storage" {
  source              = "bellanov/storage/aws"
  version             = "0.1.1"
  artifact_registries = local.storage.artifact_registries
  buckets             = local.storage.buckets
}

module "role" {
  source                = "bellanov/role/aws"
  version               = "0.1.0"
  for_each              = local.roles
  assume_role_principal = each.value.assume_role_principal
  name                  = each.key
  policy                = each.value.policy
}

# Locals
#
# Area to constrain / harness various configurations to modules / resources. 
#================================================

locals {

  roles = {
    # Example configuration for a CodeBuild service account is defined below. Its permissions
    # are defined by a policy defined via Data Source.
    # "codebuild" : {
    #   "assume_role_principal" : {
    #     "type" : "Service",
    #     "identifiers" : "ec2.amazonaws.com"
    #   },
    #   "policy" : data.aws_iam_policy_document.codebuild.json
    # }
  }

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
