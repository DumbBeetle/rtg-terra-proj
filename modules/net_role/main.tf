terraform {
  required_version = ">= 1.7.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

resource "aws_iam_role" "github_net_role" {
  name = "GitHub-Net-Role"
  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : {
          "Federated" : "arn:aws:iam::${var.github_account_id}:oidc-provider/token.actions.githubusercontent.com"
        }
        "Action" : "sts:AssumeRoleWithWebIdentity",
        "Condition" : {
          "StringEquals" : {
            "token.actions.githubusercontent.com:sub" : "repo:${var.github_repo}:ref:${var.github_branches.network}",
            "token.actions.githubusercontent.com:aud" : "sts.amazonaws.com"
          }
        }
      }
    ]
  })
}

resource "aws_iam_policy" "github_vpc_policy" {
  name = "GitHub-VPC-Policy"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action : [
          "ec2:AcceptVpcPeeringConnection",
          "ec2:AcceptVpcEndpointConnections",
          "ec2:AllocateAddress",
          "ec2:AssignIpv6Addresses",
          "ec2:AssignPrivateIpAddresses",
          "ec2:AssociateAddress",
          "ec2:AssociateDhcpOptions",
          "ec2:AssociateRouteTable",
          "ec2:AssociateSecurityGroupVpc",
          "ec2:AssociateSubnetCidrBlock",
          "ec2:AssociateVpcCidrBlock",
          "ec2:AttachClassicLinkVpc",
          "ec2:AttachInternetGateway",
          "ec2:AttachNetworkInterface",
          "ec2:AttachVpnGateway",
          "ec2:AuthorizeSecurityGroupEgress",
          "ec2:AuthorizeSecurityGroupIngress",
          "ec2:CreateCarrierGateway",
          "ec2:CreateCustomerGateway",
          "ec2:CreateDefaultSubnet",
          "ec2:CreateDefaultVpc",
          "ec2:CreateDhcpOptions",
          "ec2:CreateEgressOnlyInternetGateway",
          "ec2:CreateFlowLogs",
          "ec2:CreateInternetGateway",
          "ec2:CreateLocalGatewayRouteTableVpcAssociation",
          "ec2:CreateNatGateway",
          "ec2:CreateNetworkAcl",
          "ec2:CreateNetworkAclEntry",
          "ec2:CreateNetworkInterface",
          "ec2:CreateNetworkInterfacePermission",
          "ec2:CreateRoute",
          "ec2:CreateRouteTable",
          "ec2:CreateSecurityGroup",
          "ec2:CreateSubnet",
          "ec2:CreateTags",
          "ec2:CreateVpc",
          "ec2:CreateVpcEndpoint",
          "ec2:CreateVpcEndpointConnectionNotification",
          "ec2:CreateVpcEndpointServiceConfiguration",
          "ec2:CreateVpcPeeringConnection",
          "ec2:CreateVpnConnection",
          "ec2:CreateVpnConnectionRoute",
          "ec2:CreateVpnGateway",
          "ec2:DeleteCarrierGateway",
          "ec2:DeleteCustomerGateway",
          "ec2:DeleteDhcpOptions",
          "ec2:DeleteEgressOnlyInternetGateway",
          "ec2:DeleteFlowLogs",
          "ec2:DeleteInternetGateway",
          "ec2:DeleteLocalGatewayRouteTableVpcAssociation",
          "ec2:DeleteNatGateway",
          "ec2:DeleteNetworkAcl",
          "ec2:DeleteNetworkAclEntry",
          "ec2:DeleteNetworkInterface",
          "ec2:DeleteNetworkInterfacePermission",
          "ec2:DeleteRoute",
          "ec2:DeleteRouteTable",
          "ec2:DeleteSecurityGroup",
          "ec2:DeleteSubnet",
          "ec2:DeleteTags",
          "ec2:DeleteVpc",
          "ec2:DeleteVpcEndpoints",
          "ec2:DeleteVpcEndpointConnectionNotifications",
          "ec2:DeleteVpcEndpointServiceConfigurations",
          "ec2:DeleteVpcPeeringConnection",
          "ec2:DeleteVpnConnection",
          "ec2:DeleteVpnConnectionRoute",
          "ec2:DeleteVpnGateway",
          "ec2:DescribeAccountAttributes",
          "ec2:DescribeAddresses",
          "ec2:DescribeAvailabilityZones",
          "ec2:DescribeCarrierGateways",
          "ec2:DescribeClassicLinkInstances",
          "ec2:DescribeCustomerGateways",
          "ec2:DescribeDhcpOptions",
          "ec2:DescribeEgressOnlyInternetGateways",
          "ec2:DescribeFlowLogs",
          "ec2:DescribeInstances",
          "ec2:DescribeInternetGateways",
          "ec2:DescribeIpv6Pools",
          "ec2:DescribeLocalGatewayRouteTables",
          "ec2:DescribeLocalGatewayRouteTableVpcAssociations",
          "ec2:DescribeKeyPairs",
          "ec2:DescribeMovingAddresses",
          "ec2:DescribeNatGateways",
          "ec2:DescribeNetworkAcls",
          "ec2:DescribeNetworkInterfaceAttribute",
          "ec2:DescribeNetworkInterfacePermissions",
          "ec2:DescribeNetworkInterfaces",
          "ec2:DescribePrefixLists",
          "ec2:DescribeRouteTables",
          "ec2:DescribeSecurityGroupReferences",
          "ec2:DescribeSecurityGroupRules",
          "ec2:DescribeSecurityGroups",
          "ec2:DescribeSecurityGroupVpcAssociations",
          "ec2:DescribeStaleSecurityGroups",
          "ec2:DescribeSubnets",
          "ec2:DescribeTags",
          "ec2:DescribeVpcAttribute",
          "ec2:DescribeVpcClassicLink",
          "ec2:DescribeVpcClassicLinkDnsSupport",
          "ec2:DescribeVpcEndpointConnectionNotifications",
          "ec2:DescribeVpcEndpointConnections",
          "ec2:DescribeVpcEndpoints",
          "ec2:DescribeVpcEndpointServiceConfigurations",
          "ec2:DescribeVpcEndpointServicePermissions",
          "ec2:DescribeVpcEndpointServices",
          "ec2:DescribeVpcPeeringConnections",
          "ec2:DescribeVpcs",
          "ec2:DescribeVpnConnections",
          "ec2:DescribeVpnGateways",
          "ec2:DetachClassicLinkVpc",
          "ec2:DetachInternetGateway",
          "ec2:DetachNetworkInterface",
          "ec2:DetachVpnGateway",
          "ec2:DisableVgwRoutePropagation",
          "ec2:DisableVpcClassicLink",
          "ec2:DisableVpcClassicLinkDnsSupport",
          "ec2:DisassociateAddress",
          "ec2:DisassociateRouteTable",
          "ec2:DisassociateSecurityGroupVpc",
          "ec2:DisassociateSubnetCidrBlock",
          "ec2:DisassociateVpcCidrBlock",
          "ec2:EnableVgwRoutePropagation",
          "ec2:EnableVpcClassicLink",
          "ec2:EnableVpcClassicLinkDnsSupport",
          "ec2:GetSecurityGroupsForVpc",
          "ec2:ModifyNetworkInterfaceAttribute",
          "ec2:ModifySecurityGroupRules",
          "ec2:ModifySubnetAttribute",
          "ec2:ModifyVpcAttribute",
          "ec2:ModifyVpcEndpoint",
          "ec2:ModifyVpcEndpointConnectionNotification",
          "ec2:ModifyVpcEndpointServiceConfiguration",
          "ec2:ModifyVpcEndpointServicePermissions",
          "ec2:ModifyVpcPeeringConnectionOptions",
          "ec2:ModifyVpcTenancy",
          "ec2:MoveAddressToVpc",
          "ec2:RejectVpcEndpointConnections",
          "ec2:RejectVpcPeeringConnection",
          "ec2:ReleaseAddress",
          "ec2:ReplaceNetworkAclAssociation",
          "ec2:ReplaceNetworkAclEntry",
          "ec2:ReplaceRoute",
          "ec2:ReplaceRouteTableAssociation",
          "ec2:ResetNetworkInterfaceAttribute",
          "ec2:RestoreAddressToClassic",
          "ec2:RevokeSecurityGroupEgress",
          "ec2:RevokeSecurityGroupIngress",
          "ec2:UnassignIpv6Addresses",
          "ec2:UnassignPrivateIpAddresses",
          "ec2:UpdateSecurityGroupRuleDescriptionsEgress",
          "ec2:UpdateSecurityGroupRuleDescriptionsIngress"
        ],
        Effect   = "Allow"
        Resource = "*"
        # Limit access only to the specific vpc
        "Condition" : {
          "StringEquals" : {
            "aws:SourceVpc" : var.vpc_id
          }
        }
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "attach_github_vpc_policy" {
  role       = aws_iam_role.github_net_role.name
  policy_arn = aws_iam_policy.github_vpc_policy.arn
}

