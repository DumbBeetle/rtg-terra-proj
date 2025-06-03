# output "print_zones" {
#   value = {
#     for key, value in var.zones : key => {
#       public_cidr = value.public.cidr
#       private_cidr = value.private.cidr
#     }
#   }
# }


output "flattened" {
  value = module.network.flatten_subnets_to_type
}