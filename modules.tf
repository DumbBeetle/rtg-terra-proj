module "network" {
  source  = "./modules/network"
  vpc_id  = var.vpc_id
  subnet_zones = var.subnet_zones
  tags = local.tags
}