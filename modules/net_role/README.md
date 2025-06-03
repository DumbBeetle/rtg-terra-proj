# Net Role

Creates AWS IAM Role and Policy for GitHub Actions workflow to manage network development.

## Requirements

| Name      | Version   |
|-----------|-----------|
| Terraform | \>= 1.7.0 |
| AWS       | ~> 5.0    |

## Inputs

| Name              | Description                                             | Type        | Default | Required |
|-------------------|---------------------------------------------------------|-------------|---------|:--------:|
| github_account_id | GitHub account ID for AWS IDP                           | string      |         |   yes    |
| github_repo       | GitHub repository name for AWS role boundary            | string      |         |   yes    |
| github_branch     | GitHub branch name for AWS role boundary                | map(string) |         |   yes    |
| vpc_id            | Project vpc ID to Limit access only to the specific vpc | map(string) |         |   yes    |

## Usage

```hcl
module "net_role" {
  source            = "./modules/net_role"
  github_account_id = var.github_account_id
  github_repo       = var.github_repo
  github_branches   = var.github_branches
  vpc_id            = var.vpc_id
}
```