locals {
  bastions_instance_ids = [
    for instance in aws_instance.instances : instance.id if instance.associate_public_ip_address
  ]
  database_instance_ids = [
    for instance in aws_instance.instances : instance.id if !instance.associate_public_ip_address
  ]
  bastions_instance_public_ip = [
    for instance in aws_instance.instances : instance.public_ip if instance.associate_public_ip_address
  ]
}