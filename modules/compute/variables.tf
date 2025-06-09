variable "net_subnets" {
  type = map(string)
}

variable "net_security_groups" {
  type = map(string)
}

variable "ssh_public_key" {
  type = string
  description = "Your public ssh key"
}