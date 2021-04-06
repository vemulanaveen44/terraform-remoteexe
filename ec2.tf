
provider "aws" {
  region = "af-south-1"
}
locals {
  name = "naveen"
}
resource "aws_instance" "ec2" {
  ami                    = data.aws_ami.amzon.id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.naveen[count.index].id]
  count                  = 3
  subnet_id              = aws_subnet.naveen-subnet[count.index].id






  key_name = "naveen-key"

  tags = {
    "Name" = "${local.name}-ec2-${count.index + 1}"
  }


}
resource "aws_key_pair" "deployer" {
  key_name   = "naveen-key"
  public_key = file("./pub")
}