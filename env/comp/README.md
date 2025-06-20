# Compute Environment Deployment

This root module deploys EC2 compute resources into the network infrastructure created by the network developer.

## Purpose

- Deploy EC2 instances using the shared network infrastructure
- Integrate with existing network resources (VPC, subnets, security groups)

## Dependencies

**Network Environment Must Be Deployed First**  
This environment requires outputs from the network developer's Terraform state stored in S3

## Requirements

| Name      | Version   |
|-----------|-----------|
| Terraform | \>= 1.7.0 |
| AWS       | ~> 5.0    |

### Network Integration

Most have remote state from network developer for subnets and security groups:

### Usage

```hcl
data "terraform_remote_state" "network" {
  backend = "s3"
  config  = var.net_bucket
}

# network_subnets = data.terraform_remote_state.net_tfstate.outputs.subnets_output
# network_sgs     = data.terraform_remote_state.net_tfstate.outputs.security_groups_output
```

## Inputs

| Name                  | Description                                                               | Type   | Default | Required |
|-----------------------|---------------------------------------------------------------------------|--------|---------|:--------:|
| net_bucket            | S3 bucket and location containing network developer's `terraform.tfstate` | object |         |   yes    |
| ssh_public_key        | AWS ssh key pair name for instances access                                | string |         |   yes    |
| db_subnets_group_name | Subnets db group                                                          | string |         |   yes    |
| az_names              | Availability Zones names as a list                                        | list   |         |   yes    |

## Outputs

| Name                 | Description                           |
|----------------------|---------------------------------------|
| bastion_instance_ids | The bastion EC2 instance ID           |
| db_instance_ids      | The database EC2 instance ID          |
| bastion_public_ips   | The public IP address of the bastions |

## Data

| Name        | Description                                |
|-------------|--------------------------------------------|
| net_tfstate | Returns ami data for usage in aws_instance |

## Locals

| Name            | Description                                         |             |
|-----------------|-----------------------------------------------------|-------------|
| network_subnets | Subnets data from network developer tfstate         | map(string) |
| network_sgs     | Security Groups data from network developer tfstate | map(string) |

## Modules

| Name    | Description                                                                                   |
|---------|-----------------------------------------------------------------------------------------------|
| Compute | Deploys bastion and database instances integrated with network resources from Terraform state |
