variable "net_bucket" {
  type = object({
    bucket = string
    key    = string
    region = string
    encrypt = bool
  })
}