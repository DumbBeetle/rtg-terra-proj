# Compute Module

Deploys bastion and database instances integrated with network resources from Terraform state.

## Resources Created

- 2x Bastion EC2 instances (public subnets)
- 2x Database EC2 instances (private subnets)
- Associated subnets
- Associated security groups

## Requirements

| Name      | Version   |
|-----------|-----------|
| Terraform | \>= 1.7.0 |
| AWS       | ~> 5.0    |

## Inputs

| Name                | Description                                         | Type        | Default  | Required |
|---------------------|-----------------------------------------------------|-------------|----------|:--------:|
| instance_type       | EC2 instance type                                   | string      | t3.micro |   yes    |
| net_subnets         | Subnets data from network developer tfstate         | map(string) |          |   yes    |
| net_security_groups | Security Groups data from network developer tfstate | map(string) |          |   yes    |
| ssh_public_key      | AWS ssh key pair name for instances access          | string      |          |   yes    |

## Outputs

| Name                 | Description                           |
|----------------------|---------------------------------------|
| bastion_instance_ids | The bastion EC2 instance ID           |
| db_instance_ids      | The database EC2 instance ID          |
| bastion_public_ips   | The public IP address of the bastions |

## Data

| Name       | Description                                |
|------------|--------------------------------------------|
| ubuntu_ami | Returns ami data for usage in aws_instance |

## Locals

| Name                        | Description                                  | Type |
|-----------------------------|----------------------------------------------|------|
| bastions_instance_ids       | Filtered list of bastions instance ids       | List |
| database_instance_ids       | Filtered list of database instance ids       | List |
| bastions_instance_public_ip | Filtered list of bastions instance public ip | List |

## Usage

```hcl
module "compute" {
  source              = "../../modules/compute"
  net_subnets         = local.network_subnets
  net_security_groups = local.network_sgs
  ssh_public_key      = var.ssh_public_key
}
```