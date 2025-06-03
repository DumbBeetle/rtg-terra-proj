resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = var.vpc_id
  tags = merge(var.tags, {
    Name = "internet_gateway"
  })
}

resource "aws_route_table" "private_route_table" {
  vpc_id         = var.vpc_id
  tags = merge(var.tags, {
    Name = "private_route_table"
  })
}

resource "aws_route_table" "public_route_table" {
  vpc_id         = var.vpc_id
  tags = merge(var.tags, {
    Name = "public_route_table"
  })

  route {
    gateway_id = aws_internet_gateway.internet_gateway.id
    cidr_block = "0.0.0.0/0"
  }
}

resource "aws_route_table_association" "route_table_association" {
  for_each = local.flatten_subnets_with_zones
  route_table_id = each.value.type == "private" ? aws_route_table.private_route_table.id : aws_route_table.public_route_table.id
  subnet_id = aws_subnet.my_subnets[each.key].id
}