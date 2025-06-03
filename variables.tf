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

variable "bucket_name" {
  type        = string
  description = "S3 bucket name"
  sensitive   = true
}