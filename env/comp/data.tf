data "terraform_remote_state" "net_tfstate" {
  backend = "s3"
  config = var.net_bucket
}