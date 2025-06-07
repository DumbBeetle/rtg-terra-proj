module "network" {
  source  = "../.././modules/network"
  vpc_id  = aws_vpc.project_vpc.id
  subnet_zones = var.subnet_zones
  tags = local.tags
}

module "iam_roles" {
  source = "../../modules/iam-roles"
  github_account_id = var.github_account_id
  github_branches = var.github_branches
  github_repo       = var.github_repo
  s3_bucket_arn     = data.aws_s3_bucket.bucket_info.arn
  vpc_id            = aws_vpc.project_vpc.id
}

