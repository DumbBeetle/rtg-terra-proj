resource "aws_subnet" "my_subnets" {
  for_each          = local.flatten_subnets_with_zones
  vpc_id            = var.vpc_id
  cidr_block        = each.value.cidr
  availability_zone = each.value.availability_zone

  tags = merge(var.tags, {
    Name = each.value.name
  })
}

resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "db_group"
  subnet_ids = [for key, value in aws_subnet.my_subnets : value.id if endswith(key, "database")]
  depends_on = [aws_subnet.my_subnets]
  tags = {
    Name = "My DB subnet group"
  }
}