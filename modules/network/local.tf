locals {
  az_mapping = {
    zone_1 = data.aws_availability_zones.zones.names[0]
    zone_2 = data.aws_availability_zones.zones.names[1]
  }

  # flatten_subnets_cidr = {
  #   for key, value in var.subnets_zones: key => {
  #     public_cidr  = value.public.cidr
  #     private_cidr = value.private.cidr
  #   }
  # }
  flatten_subnets_with_zones = merge([
    for zone_name, zone in var.subnet_zones : {
      "${zone_name}_public" = {
        name              = zone.public.name
        cidr              = zone.public.cidr
        availability_zone = local.az_mapping[zone_name]
        type              = "public"
      }
      "${zone_name}_private" = {
        name              = zone.private.name
        cidr              = zone.private.cidr
        availability_zone = local.az_mapping[zone_name]
        type              = "private"
      }
    }
  ]...)

  flatten_subnets_to_type = {
    for key, value in local.flatten_subnets_with_zones : key => value.type
  }
}
