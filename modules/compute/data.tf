data aws_ami Latest_Ubuntu_AMI {
  most_recent = true
  owners = ["099720109477"]
  name_regex = "ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24*"
  filter {
    name = "architecture"
    values = ["x86_64"]
  }
}

resource "aws_instance" "example_image" {
  ami = data.aws_ami.Latest_Ubuntu_AMI.id
  instance_type = "t3.micro"
  root_block_device {
    delete_on_termination = true
    volume_size = 10
    volume_type = "gp3"
  }
  subnet_id = aws_subnet.subnet[0].id
  lifecycle {
    create_before_destroy = true
    postcondition {
      condition = contains(local.allowed_instance_types, self.instance_type)
      error_message = "Self Invalid Instance Type"
    }
  }
  tags = {
    name = "Latest Ubuntu"
    CostCenter = 1234
  }
}