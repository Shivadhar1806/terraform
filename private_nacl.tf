resource "aws_network_acl" "networkaclprivate" {
  count      = length(var.private_subnets)
  vpc_id     = aws_vpc.main.id
  subnet_ids = aws_subnet.private.*.id

  egress {
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
    protocol   = "all"
  }

  ingress {
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
    protocol   = "all"
  }
 
  tags = merge(
    {
      "Name" = format("%s-${var.private_subnet_suffix}", var.name)
    },
    var.tags,
    var.private_acl_tags,
  )
}
