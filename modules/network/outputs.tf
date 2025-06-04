# output "flattened" {
#   value = local.flatten_subnets_cidr
# }

# output "flatten_subnets" {
#   value = local.flatten_subnets_with_zones
# }

# output "flatten_subnets_to_type" {
#   value = local.flatten_subnets_to_type
# }

output "flatten_subnets_with_zones" {
  value = local.flatten_subnets_with_zones
}

output "private_subnets_map" {
  value = local.database_subnets_map
}
