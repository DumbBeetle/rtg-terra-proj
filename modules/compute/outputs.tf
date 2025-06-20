output "bastion_instance_ids" {
  value       = local.bastions_instance_ids
  description = "The bastion EC2 instance ID"
}

output "db_instance_ids" {
  value       = local.database_instance_ids
  description = "The database EC2 instance ID"
}

output "bastion_public_ips" {
  value       = local.bastions_instance_public_ip
  description = "The public IP address of the EC2 instance"
}

output "public_subs" {
  value = local.public_subnets
}