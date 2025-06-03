resource "aws_subnet" "my_subnets" {
  for_each = local.flatten_subnets_with_zones
  vpc_id = var.vpc_id
  cidr_block = each.value.cidr
  availability_zone = each.value.availability_zone

  tags = merge(var.tags, {
    Name = each.value.name
  })
}