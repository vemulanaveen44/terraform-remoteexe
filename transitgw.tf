resource "aws_ec2_transit_gateway" "naveen-tgw" {
  tags = {
    "Name" = "${local.name}-tgw"
  }

}
resource "aws_ec2_transit_gateway_vpc_attachment" "naveen-tgw" {
  count              = 3
  subnet_ids         = [aws_subnet.naveen-subnet[count.index].id]
  transit_gateway_id = aws_ec2_transit_gateway.naveen-tgw.id
  vpc_id             = aws_vpc.naveen-vpc[count.index].id
  tags = {
    "Name" = "${local.name}-tgw-${count.index + 1}"
  }

}