variable "net_subnets" {
  type = map(string)
}

variable "net_security_groups" {
  type = map(string)
}

variable "db_subnets_group_name" {
  type = string
}

variable "ssh_public_key" {
  type        = string
  description = "Your public ssh key"
}

variable "availability_zones" {
  type = list(string)
}