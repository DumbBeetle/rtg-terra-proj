locals {
  az_mapping = {
    zone_1 = data.aws_availability_zones.az.names[0]
    zone_2 = data.aws_availability_zones.az.names[1]
  }

  flatten_subnets_with_zones = merge([
    for zone_name, zone in var.subnet_zones : {
      "${zone_name}_public" = {
        name              = zone.public.name
        cidr              = zone.public.cidr
        availability_zone = local.az_mapping[zone_name]
        type              = "public"
      }
      "${zone_name}_database" = {
        name              = zone.database.name
        cidr              = zone.database.cidr
        availability_zone = local.az_mapping[zone_name]
        type              = "database"
      }
    }
  ]...)

  database_subnets_map = {
      for key, value in local.flatten_subnets_with_zones : key => value if endswith(key, "database")
  }

  public_subnets_map = {
    for key, value in local.flatten_subnets_with_zones : key => value if endswith(key, "public")
  }
}
