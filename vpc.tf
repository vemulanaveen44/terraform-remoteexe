resource "aws_vpc" "naveen-vpc" {
  count              = length(var.cidr)
  cidr_block         = element(var.cidr, count.index)
  enable_dns_support = true

  tags = {
    "Name" = "${local.name}-vpc-${count.index + 1}"
  }
}