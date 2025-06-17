output "subnets_output" {
  value = module.network.subnets_output
}

output "security_groups_output" {
  value = module.network.security_groups_output
}

output "project_vpc_id" {
  value = aws_vpc.project_vpc.id
}

output "db_subnets_group" {
  value = module.network.db_subnets_group
}

output "az_names" {
  value = module.network.az_names
}