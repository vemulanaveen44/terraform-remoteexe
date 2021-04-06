resource "aws_security_group" "naveen" {
  count       = 3
  vpc_id      = aws_vpc.naveen-vpc[count.index].id
  name        = "naveen-sg-${count.index + 1}"
  description = "Only Http connection Inbound"
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    "Name"      = "${local.name}-sg"
    description = "naveen sg all allow"
  }
}