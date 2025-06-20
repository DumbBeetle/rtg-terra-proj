module "compute" {
  source                = "../../modules/compute"
  net_subnets           = local.network_subnets
  net_security_groups   = local.network_sgs
  db_subnets_group_name = local.db_subnets_group_name
  ssh_public_key        = var.ssh_public_key
  availability_zones    = local.az_names
}