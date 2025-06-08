output "bastion_instance_ids" {
  value = module.compute.bastion_instance_ids
  description = "The bastion EC2 instance ID"
}

output "db_instance_ids" {
  value = module.compute.db_instance_ids
  description = "The database EC2 instance ID"
}

output "bastion_public_ips" {
  value = module.compute.bastion_public_ips
  description = "The public IP address of the bastions"
}