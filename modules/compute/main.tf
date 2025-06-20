terraform {
  required_version = ">= 1.11.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

resource "aws_instance" "instances" {
  for_each                    = local.public_subnets
  ami                         = data.aws_ami.ubuntu_ami.id
  instance_type               = "t3.micro"
  subnet_id                   = each.value
  security_groups             = [var.net_security_groups[each.key]]
  associate_public_ip_address = true
  key_name                    = var.ssh_public_key
  root_block_device {
    delete_on_termination = true
    volume_size           = 8
    volume_type           = "gp3"
  }

  lifecycle {
    ignore_changes = [
      security_groups,
    ]
  }
}

resource "aws_db_instance" "db_instance" {
  instance_class          = "db.t4g.micro"
  allocated_storage       = 20
  db_name                 = "mydb"
  engine                  = "mysql"
  engine_version          = "8.0.41"
  username                = "db_user"
  password                = data.aws_ssm_parameter.db_password.value
  skip_final_snapshot     = true
  backup_retention_period = 1
  db_subnet_group_name    = var.db_subnets_group_name
  vpc_security_group_ids  = [var.net_security_groups["zone_1_database"]]
  availability_zone       = var.availability_zones[0]
  depends_on = [data.aws_ssm_parameter.db_password]
}

resource "aws_db_instance" "db_replica" {
  instance_class          = "db.t4g.micro"
  skip_final_snapshot     = true
  backup_retention_period = 1
  replicate_source_db     = aws_db_instance.db_instance.identifier
  vpc_security_group_ids  = [var.net_security_groups["zone_2_database"]]
  availability_zone       = var.availability_zones[1]
}