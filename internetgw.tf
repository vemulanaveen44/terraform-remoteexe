resource "aws_internet_gateway" "naveenigw" {
  count  = 3
  vpc_id = aws_vpc.naveen-vpc[count.index].id
  tags = {
    "Name" = "${local.name}-igw-${count.index + 1}"
  }

}

resource "aws_route_table" "rpu" {
  count  = 3
  vpc_id = aws_vpc.naveen-vpc[count.index].id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.naveenigw[count.index].id

  }
  route {

    cidr_block         = element(var.cidr, count.index + 1)
    transit_gateway_id = aws_ec2_transit_gateway.naveen-tgw.id

  }

  route {

    cidr_block         = element(var.cidr, count.index + 2)
    transit_gateway_id = aws_ec2_transit_gateway.naveen-tgw.id

  }


  tags = {
    "Name" = "${local.name}-igw-${count.index + 1}"
  }
}
resource "aws_route_table_association" "naveen_public" {
  count          = 3
  subnet_id      = aws_subnet.naveen-subnet[count.index].id
  route_table_id = aws_route_table.rpu[count.index].id


}
