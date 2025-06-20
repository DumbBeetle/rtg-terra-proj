resource "aws_ssm_parameter" "secret" {
  name        = "/database/password"
  description = "mysql rds password (preferable to use this in a seperated terraform workspace)"
  type        = "SecureString"
  value       = "your_password"
}