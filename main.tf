terraform {
  required_version = ">= 1.7.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.99.1"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.7.2"
    }
  }
}

provider "aws" {
  region = "eu-north-1"
}

resource "aws_vpc" "project_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = merge(local.tags, {
    Name = "${local.tags.Name}-vpc"
  })
}