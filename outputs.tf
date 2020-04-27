output "vpc_id" {
  description = "The ID of the VPC"
  value       = concat(aws_vpc.main.*.id, [""])[0]
}

output "vpc_arn" {
  description = "The ARN of the VPC"
  value       = concat(aws_vpc.main.*.arn, [""])[0]
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = concat(aws_vpc.main.*.cidr_block, [""])[0]
}

output "vpc_instance_tenancy" {
  description = "Tenancy of instances spin up within VPC"
  value       = concat(aws_vpc.main.*.instance_tenancy, [""])[0]
}

output "vpc_enable_dns_support" {
  description = "Whether or not the VPC has DNS support"
  value       = concat(aws_vpc.main.*.enable_dns_support, [""])[0]
}

output "vpc_enable_dns_hostnames" {
  description = "Whether or not the VPC has DNS hostname support"
  value       = concat(aws_vpc.main.*.enable_dns_hostnames, [""])[0]
}

output "vpc_enable_classiclink" {
  description = "Whether or not the VPC has Classiclink enabled"
  value       = concat(aws_vpc.main.*.enable_classiclink, [""])[0]
}

output "igw_id" {
  description = "The ID of the Internet Gateway"
  value       = concat(aws_internet_gateway.igw.*.id, [""])[0]
}

output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = aws_subnet.public.*.id
}

output "public_subnet_arns" {
  description = "List of ARNs of public subnets"
  value       = aws_subnet.public.*.arn
}

output "public_subnets_cidr_blocks" {
  description = "List of cidr_blocks of public subnets"
  value       = aws_subnet.public.*.cidr_block
}

output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = aws_subnet.private.*.id
}

output "private_subnet_arns" {
  description = "List of ARNs of private subnets"
  value       = aws_subnet.private.*.arn
}

output "private_subnets_cidr_blocks" {
  description = "List of cidr_blocks of private subnets"
  value       = aws_subnet.private.*.cidr_block
}

output "public_route_table_id" {
  description = "ID of created public route table"
  value       = aws_route_table.public.id
}

output "private_route_table_ids" {
  description = "List of created private route table IDs"
  value       = aws_route_table.private.*.id
}

output "nat_ids" {
  description = "List of allocation ID of Elastic IPs created for AWS NAT Gateway"
  value       = aws_eip.eip.*.id
}

output "nat_public_ips" {
  description = "List of public Elastic IPs created for AWS NAT Gateway"
  value       = aws_eip.eip.*.public_ip
}

output "private_network_acl_id" {
  description = "ID of the private network ACL"
  value       = aws_network_acl.networkaclprivate.*.id
}

output "public_network_acl_id" {
  description = "ID of the public network ACL"
  value       = aws_network_acl.networkaclpublic.*.id
}







