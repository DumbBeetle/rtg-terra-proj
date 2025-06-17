# Network Environment Deployment

This root module deploys the network infrastructure to be used by the compute developer.

## Purpose

- Deploy VPC, Subnets, Security Groups, Network ACL, Route Tables
- Save tfstate file to the S3 bucket for usage by the Compute Environment

## Requirements

| Name      | Version   |
|-----------|-----------|
| Terraform | \>= 1.7.0 |
| AWS       | ~> 5.0    |

## Inputs

| Name              | Description                                         | Type   | Default | Required |
|-------------------|-----------------------------------------------------|--------|---------|:--------:|
| subnet_zones      | Map variable for creating the Subnets               | map    |         |   yes    |
| github_account_id | GitHub account ID for AWS IDP                       | string |         |   yes    |
| github_repo       | GitHub repository name for AWS role boundary        | string |         |   yes    |
| github_branches   | GitHub branch name for AWS role boundary            | map    |         |   yes    |
| s3_bucket_name    | S3 bucket name for getting the bucket data from AWS | string |         |   yes    |

## Outputs

| Name                   | Description                                                     |
|------------------------|-----------------------------------------------------------------|
| subnets_output         | Output the Subnets for usage in the Compute Environment         |
| security_groups_output | Output the Security Groups for usage in the Compute Environment |
| project_vpc_id         | Output the Project VPC ID                                       |
| db_subnets_group       | Subnets db group                                                |
| az_names               | Availability Zones names as a list                              |

## Data

| Name        | Description                               |
|-------------|-------------------------------------------|
| bucket_info | Returns S3 bucket data for tfstate saving |

## Locals

| Name | Description              | type |
|------|--------------------------|------|
| tags | Basic Tags for resources | map  |

## Modules

| Name      | Description                                                                                     |
|-----------|-------------------------------------------------------------------------------------------------|
| IAM Roles | Configure Roles and Policies for GitHub Actions workflow access                                 |
| Network   | Configure the Network infrastructure [VPC, Subnets, Security Groups, Network ACL, Route Tables] |
