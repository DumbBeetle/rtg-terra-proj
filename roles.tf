variable "github_account_id" {
  description = "github account id"
  type        = string
  sensitive   = true
}

module "roles" {
  source        = "./modules/roles"
  github_account_id    = var.github_account_id
  s3_bucket_arn = aws_s3_bucket.project_bucket.arn
  vpc_id        = aws_vpc.project_vpc.id
}
