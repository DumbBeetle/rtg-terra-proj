#---------
# Public
#---------
resource "aws_network_acl" "acl_public" {
  for_each = var.subnet_zones
  vpc_id   = var.vpc_id

  egress {
    protocol   = "tcp"
    rule_no    = 1
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 80
    to_port    = 443
  }
  egress {
    protocol   = "tcp"
    rule_no    = 2
    action     = "allow"
    cidr_block = local.database_subnets_map["${each.key}_database"].cidr
    from_port  = 22
    to_port    = 22
  }
  egress {
    protocol   = "tcp"
    rule_no    = 3
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 1024
    to_port    = 65535
  }
  egress {
    protocol   = "icmp"
    rule_no    = 4
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
    icmp_type  = 0
    icmp_code  = -1
  }
  egress {
    protocol   = "icmp"
    rule_no    = 5
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
    icmp_type  = 8
    icmp_code  = -1
  }
  ingress {
    protocol   = "icmp"
    rule_no    = 1
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
    icmp_type  = 8
    icmp_code  = -1
  }
  ingress {
    protocol   = "icmp"
    rule_no    = 2
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
    icmp_type  = 0
    icmp_code  = -1
  }
  ingress {
    protocol   = "tcp"
    rule_no    = 3
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 22
    to_port    = 22
  }
  ingress {
    protocol   = "tcp"
    rule_no    = 4
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 1024
    to_port    = 65535
  }

  tags = merge(var.tags, {
    Name = "${each.key}_public_acl"
  })
}

resource "aws_network_acl_association" "acl_associate_public" {
  for_each       = aws_network_acl.acl_public
  network_acl_id = aws_network_acl.acl_public[each.key].id
  subnet_id      = aws_subnet.my_subnets["${each.key}_public"].id
}

#---------
# Database
#---------
resource "aws_network_acl" "acl_database" {
  for_each = var.subnet_zones
  vpc_id   = var.vpc_id

  ingress {
    protocol   = "icmp"
    rule_no    = 1
    action     = "allow"
    cidr_block = local.public_subnets_map["${each.key}_public"].cidr
    from_port  = 0
    to_port    = 0
    icmp_type  = 8
    icmp_code  = -1
  }
  ingress {
    protocol   = "tcp"
    rule_no    = 2
    action     = "allow"
    cidr_block = local.public_subnets_map["${each.key}_public"].cidr
    from_port  = 22
    to_port    = 22
  }
  egress {
    protocol   = "tcp"
    rule_no    = 1
    action     = "allow"
    cidr_block = local.public_subnets_map["${each.key}_public"].cidr
    from_port  = 1024
    to_port    = 65535
  }
  egress {
    protocol   = "icmp"
    rule_no    = 2
    action     = "allow"
    cidr_block = local.public_subnets_map["${each.key}_public"].cidr
    from_port  = 0
    to_port    = 0
    icmp_type  = 0
    icmp_code  = -1
  }

  tags = merge(var.tags, {
    Name = "${each.key}_database_acl"
  })
}

resource "aws_network_acl_association" "acl_associate_database" {
  for_each       = aws_network_acl.acl_database
  network_acl_id = aws_network_acl.acl_database[each.key].id
  subnet_id      = aws_subnet.my_subnets["${each.key}_database"].id
}
