variable "aws_public_subnet" {}

variable "aws_private_subnet" {}

variable "aws_vpc_id" {}

variable "alltag" {}

data "aws_availability_zones" "az" {
  state = "available"
}

locals {
  company_name = var.alltag
  vpc_id = var.aws_vpc_id
  public_subnet = var.aws_public_subnet
  private_subnet = var.aws_private_subnet
  zone_id_a = data.aws_availability_zones.az.names[0]
  zone_id_c = data.aws_availability_zones.az.names[2]
}