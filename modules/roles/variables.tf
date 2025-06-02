variable "github_account_id" {
  description = "github account id"
  type        = string
  sensitive   = true
}
variable "s3_bucket_arn" {
  description = "project s3 bucket arn"
  type        = string
  sensitive   = true
}

variable "vpc_id" {
  description = "project vpc id"
  type        = string
  sensitive   = true
}