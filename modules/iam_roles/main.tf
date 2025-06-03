terraform {
  required_version = ">= 1.7.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

module "ec2_role" {
  source            = "../ec2_role"
  github_account_id = var.github_account_id
  github_branches   = var.github_branches
  github_repo       = var.github_repo
  vpc_id            = var.vpc_id
}

module "s3_role" {
  source            = "../s3_role"
  github_account_id = var.github_account_id
  github_branches   = var.github_branches
  github_repo       = var.github_repo
  vpc_id            = var.vpc_id
  s3_bucket_arn     = var.s3_bucket_arn
}

module "net_role" {
  source            = "../net_role"
  github_account_id = var.github_account_id
  github_branches   = var.github_branches
  github_repo       = var.github_repo
  vpc_id            = var.vpc_id
}