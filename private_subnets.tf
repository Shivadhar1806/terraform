resource "aws_subnet" "private" {
  count                           = length(data.aws_availability_zones.available.names)
  vpc_id                          = aws_vpc.main.id
  cidr_block                      = var.private_subnets[count.index]
  availability_zone               = data.aws_availability_zones.available.names[count.index]

  tags = merge(
    {
      "Name" = format(
        "%s-${var.private_subnet_suffix}-%s",
        var.name,
        element(var.azs, count.index),
      )
    },
    var.tags,
    var.private_subnet_tags,
  )
}

  