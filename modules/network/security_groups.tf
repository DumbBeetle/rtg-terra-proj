resource "aws_security_group" "public_security" {
  name = "public network security"
}

resource "aws_security_group" "private_security" {
  name = "private network security"
}

resource "aws_vpc_security_group_ingress_rule" "allow_inbound_ssh_connection" {
  from_port         = 22
  security_group_id = aws_security_group.private_security.id
  to_port           = 22
  ip_protocol       = "ssh"
}

resource "aws_vpc_security_group_egress_rule" "allow_outbound_ssh_connection" {
  from_port         = 22
  security_group_id = aws_security_group.public_security.id
  to_port           = 22
  ip_protocol       = "ssh"
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.public_security.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

resource "aws_vpc_security_group_egress_rule" "allow_all_icmp" {
  security_group_id = aws_security_group.public_security.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol = "icmp"
}