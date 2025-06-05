variable "instance_type" {
  type = string
  default = "t3.micro"
  validation {
    condition = var.instance_type == "t3.micro"
    error_message = "Invalid Instance Type"
  }
}

variable "net_subnets" {
  type = map(string)
}

variable "net_security_groups" {
  type = map(string)
}
