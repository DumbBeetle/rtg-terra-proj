# Network Module

Creates the Network infrastructure

- Subnets
- Security Groups
- Network ACL
- Route Tables.

## Requirements

| Name      | Version   |
|-----------|-----------|
| Terraform | \>= 1.7.0 |
| AWS       | ~> 5.0    |

## Inputs

| Name         | Description                           | Type   | Default | Required |
|--------------|---------------------------------------|--------|---------|:--------:|
| vpc_id       | VPC ID for deploying location         | string |         |   yes    |
| subnet_zones | Map variable for creating the Subnets | map    |         |   yes    |
| tags         | Receive tags from root module         | map    |         |   yes    |

## Outputs

| Name                   | Description                                          |
|------------------------|------------------------------------------------------|
| subnets_output         | Subnets for usage in the Compute Environment         |
| security_groups_output | Security Groups for usage in the Compute Environment |
| db_subnets_group       | Subnets db group                                     |
| az_names               | Availability Zones names as a list                   |

## Data

| Name | Description                    |
|------|--------------------------------|
| az   | Returns VPC availability zones |

## Locals

| Name                       | Description                                                                   | type |
|----------------------------|-------------------------------------------------------------------------------|------|
| az_mapping                 | Create map with two availability zones                                        | map  |
| flatten_subnets_with_zones | Create map and add the zones from az_mapping to each subnet from subnet_zones | map  |
| database_subnets_map       | Create ap with only the database subnets                                      | map  |
| public_subnets_map         | Create map with only the public subnets                                       | map  |

## Usage

```hcl
module "network" {
  source       = "../.././modules/network"
  vpc_id       = aws_vpc.project_vpc.id
  subnet_zones = var.subnet_zones
  tags         = local.tags
}
```
