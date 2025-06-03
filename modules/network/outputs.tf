
# output "flattened" {
#   value = local.flatten_subnets_cidr
# }

# output "flatten_subnets" {
#   value = local.flatten_subnets_with_zones
# }

output "flatten_subnets_to_type" {
  value = local.flatten_subnets_to_type
}



# output "flattened" {
#   value = [
#     for key in local.flatten_subnets_cidr : [for value in key : value]
#   ]
# }


