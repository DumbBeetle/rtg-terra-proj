output "subnets_output" {
  value = module.network.subnets_output
}

output "security_groups_output" {
  value = module.network.security_groups_output
}

output "project_vpc_id" {
  value = aws_vpc.project_vpc.id
}
