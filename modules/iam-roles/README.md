# IAM_Roles

Creates a set of AWS IAM Role and Policy for GitHub Actions workflow
EC2_Role: ec2 instances.
VPC_Role: network development.
S3_Role: saving tfstate files in the s3 bucket

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