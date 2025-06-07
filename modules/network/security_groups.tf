resource "aws_security_group" "sg" {
  for_each = local.flatten_subnets_with_zones
  name     = "${each.key}_sg"
  vpc_id = var.vpc_id
}

resource "aws_vpc_security_group_ingress_rule" "allow_inbound_ssh_connection" {
  count = 2
  from_port         = 22
  security_group_id = aws_security_group.sg["zone_${count.index + 1}_database"].id
  referenced_security_group_id = aws_security_group.sg["zone_${count.index + 1}_public"].id
  to_port           = 22
  ip_protocol       = "tcp"
  tags = {
    Name = "Allow ssh connections from public subnet"
  }
  depends_on = [aws_security_group.sg]
}

resource "aws_vpc_security_group_egress_rule" "allow_outbound_ssh_connection" {
  count = 2
  from_port         = 22
  security_group_id = aws_security_group.sg["zone_${count.index + 1}_public"].id
  referenced_security_group_id = aws_security_group.sg["zone_${count.index + 1}_database"].id
  to_port           = 22
  ip_protocol       = "tcp"
  tags = {
    Name = "Allow ssh connections to database subnet"
  }
  depends_on = [aws_security_group.sg]
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  for_each          = local.public_subnets_map
  security_group_id = aws_security_group.sg[each.key].id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
  tags = {
    Name = "Allow access to the internet"
  }
  depends_on = [aws_security_group.sg]
}

resource "aws_vpc_security_group_ingress_rule" "allow_all_icmp_to_public_subnet" {
  for_each          = local.public_subnets_map
  security_group_id = aws_security_group.sg[each.key].id
  from_port         = -1
  to_port           = -1
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "icmp"
  tags = {
    Name = "Allow pinging the public subnet"
  }
  depends_on = [aws_security_group.sg]
}

resource "aws_vpc_security_group_ingress_rule" "allow_all_icmp_public_subnet_to_private" {
  count = 2
  security_group_id = aws_security_group.sg["zone_${count.index + 1}_database"].id
  referenced_security_group_id = aws_security_group.sg["zone_${count.index + 1}_public"].id
  from_port         = -1
  to_port           = -1
  ip_protocol       = "icmp"
  tags = {
    Name = "Allow pinging the database subnet from the public subnet"
  }
  depends_on = [aws_security_group.sg]
}