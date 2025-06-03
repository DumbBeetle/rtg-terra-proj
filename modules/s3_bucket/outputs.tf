output "s3_bucket_arn" {
  value       = aws_s3_bucket.project_bucket.arn
  description = "s3 bucket arn identifier"
  sensitive   = true
}