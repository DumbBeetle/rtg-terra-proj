data "aws_s3_bucket" "bucket_info" {
  bucket = var.s3_bucket_name
}