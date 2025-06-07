variable "subnet_zones" {
  type = map(object({
    public = object({
      name = string
      cidr = string
    })
    database = object({
      name = string
      cidr = string
    })
  }))
}

variable "bucket_name" {
  type        = string
  description = "S3 bucket name"
  sensitive   = true
}

variable "github_account_id" {
  description = "GitHub account ID for AWS IDP       "
  type        = string
  sensitive   = true
}

variable "github_repo" {
  description = "GitHub repository name for AWS role boundary "
  type        = string
}

variable "github_branches" {
  description = "GitHub branch name for AWS role boundary"
  type = map(string)
}

variable "s3_bucket_name" {
  description = "project s3 bucket name"
  type        = string
  sensitive   = true
}
