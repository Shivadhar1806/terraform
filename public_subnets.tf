resource "aws_subnet" "public" {
  count                           = length(data.aws_availability_zones.available.names)
  vpc_id                          = aws_vpc.main.id
  cidr_block                      = element(concat(var.public_subnets, [""]), count.index)
  availability_zone               = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch         = var.map_public_ip_on_launch

  tags = merge(
    {
      "Name" = format(
        "%s-${var.public_subnet_suffix}-%s",
        var.name,
        element(var.azs, count.index),
      )
    },
    var.tags,
    var.public_subnet_tags,
  )
}



