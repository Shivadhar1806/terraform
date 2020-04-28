resource "aws_subnet" "private" {
  count                           = length(var.azs)
  vpc_id                          = aws_vpc.main.id
  cidr_block                      = var.private_subnets[count.index]
  availability_zone               = element(var.azs, count.index)

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

  