variable "net_subnets" {
  type = map(string)
  description = "Subnets data from network developer tfstate "
}

variable "net_security_groups" {
  type = map(string)
  description = "Security Groups data from network developer tfstate"
}

variable "db_subnets_group_name" {
  type = string
  description = "name of the database subnet group"
}

variable "ssh_public_key" {
  type        = string
  description = "AWS ssh key pair name for instances access"
}

variable "availability_zones" {
  type = list(string)
  description = "vpc availability zones"
}