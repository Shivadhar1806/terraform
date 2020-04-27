resource "aws_nat_gateway" "nat" {
  count         = length(data.aws_availability_zones.available.names)
  allocation_id = element(aws_eip.eip.*.id, count.index)
  subnet_id     = element(aws_subnet.public.*.id, count.index)

  tags = merge(
    {
      "Name" = format(
        "%s-%s",
        var.name,
        element(var.azs, var.single_nat_gateway ? 0 : count.index),
      )
    },
    var.tags,
    var.nat_gateway_tags,
  )
}


