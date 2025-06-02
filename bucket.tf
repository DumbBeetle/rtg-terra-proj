resource "random_id" "bucket_prefix" {
  byte_length = 8
}

resource "aws_s3_bucket" "project_bucket" {
  bucket = "devops-project-bucket-${random_id.bucket_prefix.hex}"
}

resource "aws_s3_bucket_public_access_block" "block_public" {
  bucket = aws_s3_bucket.project_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_versioning" "enable_versioning" {
  bucket = aws_s3_bucket.project_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}
