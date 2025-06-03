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
  type        = map(string)
}

variable "vpc_id" {
  description = "Project VPC ID to Limit access only to the specific vpc"
  type        = string
  sensitive   = true
}