variable "github_account_id" {
  description = "github account id"
  type        = string
  sensitive = true
}

variable "github_repo" {
  description = "github repo"
  type        = string
}

variable "github_branches" {
  description = "github branches"
  type        = map(string)
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