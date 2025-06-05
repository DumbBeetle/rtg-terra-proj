# output "flattened" {
#   value = local.flatten_subnets_cidr
# }

# output "flatten_subnets" {
#   value = local.flatten_subnets_with_zones
# }

# output "flatten_subnets_to_type" {
#   value = local.flatten_subnets_to_type
# }

# output "flatten_subnets_with_zones" {
#   value = local.flatten_subnets_with_zones
# }
#
# output "private_subnets_map" {
#   value = local.database_subnets_map
# }


output "subnets_output" {
  value = {
    for key, value in aws_subnet.my_subnets : key => value.id
  }
}

output "security_groups_output" {
  value = {
    for key, value in aws_security_group.sg : key => value.id
  }
}