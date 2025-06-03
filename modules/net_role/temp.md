# Net Role
Creates a role and policy for network developing.

## Usage
```hcl
module "net_roles" {
  source           = "./modules/s3_role"
  github_account_id     = "get variable outside of module"
  github_repo = "get variable outside of module"
  github_branches = "get variable outside of module"
  vpc_id             = aws_vpc.main.id
}
```