variable "cidr" {
  type    = list
  default = ["10.0.0.0/16", "11.0.0.0/16", "12.0.0.0/16"]

}

variable "instance_type" {
  default = "t3.micro"
}