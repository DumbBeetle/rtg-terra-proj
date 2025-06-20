data "aws_ami" "ubuntu_ami" {
  owners     = ["099720109477"]
  name_regex = "ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-20250530"
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

data "aws_ssm_parameter" "db_password" {
  name = "/database/password"
  depends_on = [aws_ssm_parameter.secret]
}