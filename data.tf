data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_ami" "amzon" {
  owners      = ["amazon"]
  most_recent = true
  name_regex  = "^amzn2-ami-hvm.*gp2$"

}