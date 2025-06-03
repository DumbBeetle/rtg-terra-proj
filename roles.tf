variable "github_account_id" {
  description = "github account id"
  type        = string
  sensitive   = true
}

variable "github_repo" {
  description = "github account id"
  type        = string
  sensitive   = true
}

variable "github_branches" {
  description = "github branches"
  type        = map(string)
  sensitive   = true
}

module "roles" {
  source            = "./modules/roles"
  github_account_id = var.github_account_id
  s3_bucket_arn     = aws_s3_bucket.project_bucket.arn
  vpc_id            = aws_vpc.project_vpc.id
  github_repo       = var.github_repo
  github_branches   = var.github_branches
}
