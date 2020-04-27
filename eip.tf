resource "aws_eip" "eip" {
  count = length(data.aws_availability_zones.available.names)

  vpc      = true


  tags = merge(
    {
      "Name" = format(
        "%s-%s",
        var.name,
        element(var.azs, var.single_nat_gateway ? 0 : count.index),
      )
    },
    var.tags,
    var.nat_eip_tags,
  )
}