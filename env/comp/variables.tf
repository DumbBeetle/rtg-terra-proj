variable "net_bucket" {
  type = object({
    bucket = string
    key    = string
    region = string
    encrypt = bool
  })
  description = "S3 bucket net developer tfstate file"
}

variable "ssh_public_key" {
  type = string
  description = "AWS public ssh key "
}