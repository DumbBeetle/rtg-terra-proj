locals {
  network_subnets = data.terraform_remote_state.net_tfstate.outputs.subnets_output
  network_sgs     = data.terraform_remote_state.net_tfstate.outputs.security_groups_output
}