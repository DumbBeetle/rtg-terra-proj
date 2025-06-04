variable "vpc_id" {
  type        = string
  description = "Project VPC ID"
  sensitive   = true
}

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

