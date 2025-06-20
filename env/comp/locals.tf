locals {
  network_subnets       = data.terraform_remote_state.net_tfstate.outputs.subnets_output
  network_sgs           = data.terraform_remote_state.net_tfstate.outputs.security_groups_output
  db_subnets_group_name = data.terraform_remote_state.net_tfstate.outputs.db_subnets_group.name
  az_names              = data.terraform_remote_state.net_tfstate.outputs.az_names
}