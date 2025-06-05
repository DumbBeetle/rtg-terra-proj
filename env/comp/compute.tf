module "compute" {
  source = "../../modules/compute"
  net_subnets = local.network_subnets
  net_security_groups = local.network_sgs
}