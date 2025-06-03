# IAM_Roles

Use modules EC2_Role, Net_Role, S3_Role to creates a set of AWS IAM Role and Policy for EC2, VPC, S3

## Requirements

| Name      | Version   |
|-----------|-----------|
| Terraform | \>= 1.7.0 |
| AWS       | ~> 5.0    |

## Inputs

| Name              | Description                                                           | Type        | Default | Required |
|-------------------|-----------------------------------------------------------------------|-------------|---------|:--------:|
| github_account_id | GitHub account ID for AWS IDP                                         | string      |         |   yes    |
| github_repo       | GitHub repository name for AWS role boundary                          | string      |         |   yes    |
| github_branch     | GitHub branch name for AWS role boundary                              | map(string) |         |   yes    |
| vpc_id            | Project vpc ID to Limit access only to the specific vpc               | map(string) |         |   yes    |
| s3_bucket_arn     | AWS S3 bucket arn identifier for accessing and managing tfstate files | map(string) |         |   yes    |


## Modules
| Name       | Source             | Description                          |
|------------|--------------------|--------------------------------------|
| EC2_Role   | ./modules/ec2_role | IAM Role and Policy for EC2 access   |
| Net_Role   | ./modules/net_role | IAM Role and Policy for VPC access   |
| S3_Role    | ./modules/s3_role  | IAM Role and Policy for S3 access    |

## Usage

```hcl
module "iam_roles" {
  source            = "./modules/iam_roles"
  github_account_id = var.github_account_id
  github_repo       = var.github_repo
  github_branches   = var.github_branches
  vpc_id            = var.vpc_id
  s3_bucket_arn     = var.s3_bucket_arn
}
```