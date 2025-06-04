# output "print_zones" {
#   value = {
#     for key, value in var.zones : key => {
#       public_cidr = value.public.cidr
#       private_cidr = value.private.cidr
#     }
#   }
# }



# output "flatten_subnets_with_zones" {
#   value = module.network.flatten_subnets_with_zones
# }
# output "private_subnets_map" {
#   value = module.network.private_subnets_map
# }
