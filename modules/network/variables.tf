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
    private = object({
      name = string
      cidr = string
    })
  }))
}

variable "tags" {}