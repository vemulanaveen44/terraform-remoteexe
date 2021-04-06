resource "aws_subnet" "naveen-subnet" {
  count                   = 3
  vpc_id                  = aws_vpc.naveen-vpc[count.index].id
  availability_zone       = element(data.aws_availability_zones.available.names, count.index)
  cidr_block              = cidrsubnet(element(var.cidr, count.index), 8, count.index)
  map_public_ip_on_launch = true
  tags = {
    "Name" = "${local.name}-sub-${count.index + 1}"

  }
}