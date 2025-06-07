module "compute" {
  source = "../../modules/compute"
  net_subnets = local.network_subnets
  net_security_groups = local.network_sgs
  ssh_public_key = var.ssh_public_key
}