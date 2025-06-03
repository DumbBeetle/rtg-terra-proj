module "s3_bucket" {
  source      = "./modules/s3_bucket"
  bucket_name = var.bucket_name
}

module "iam_roles" {
  source            = "./modules/iam_roles"
  github_account_id = var.github_account_id
  github_repo       = var.github_repo
  github_branches   = var.github_branches
  vpc_id            = aws_vpc.project_vpc.id
  s3_bucket_arn     = module.s3_bucket.s3_bucket_arn
}
