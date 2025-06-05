data aws_ami Latest_Ubuntu_AMI {
  most_recent = true
  owners = ["099720109477"]
  name_regex = "ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24*"
  filter {
    name = "architecture"
    values = ["x86_64"]
  }
}
