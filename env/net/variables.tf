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
  description = "Map variable for creating the Subnets"

  # Check Cidr
  validation {
    condition = alltrue([
      for zone in values(var.subnet_zones) :
      can(cidrnetmask(zone.public.cidr)) && can(cidrnetmask(zone.database.cidr))
    ])
    error_message = "Invalid public or database Cidr, All must be valid"
  }
  # Check unique subnet names
  validation {
    condition = length(toset(flatten([
      for zone in values(var.subnet_zones) : [zone.public.name, zone.database.name]
    ]))) == (length(var.subnet_zones) * 2)
    error_message = "All subnets names (public and database) must be unique"
  }
}

variable "github_account_id" {
  description = "GitHub account ID for AWS IDP"
  type        = string
  sensitive   = true
}

variable "github_repo" {
  description = "GitHub repository name for AWS role boundary"
  type        = string
}

variable "github_branches" {
  description = "GitHub branch name for AWS role boundary"
  type        = map(string)
}

variable "s3_bucket_name" {
  description = "project s3 bucket name"
  type        = string
  sensitive   = true
}
