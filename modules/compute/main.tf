terraform {
  required_version = ">= 1.7.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

resource "aws_instance" "instances" {
  for_each = var.net_subnets
  ami = data.aws_ami.Latest_Ubuntu_AMI.id
  instance_type = var.instance_type
  subnet_id = var.net_subnets[each.key]
  security_groups = [var.net_security_groups[each.key]]
  associate_public_ip_address = endswith(each.key, "public")
  key_name = var.ssh_public_key
  root_block_device {
    delete_on_termination = true
    volume_size = 10
    volume_type = "gp3"
  }
}