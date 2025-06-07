variable "net_bucket" {
  type = object({
    bucket = string
    key    = string
    region = string
    encrypt = bool
  })
}

variable "ssh_public_key" {
  type = string
  description = "Your public ssh key"
}