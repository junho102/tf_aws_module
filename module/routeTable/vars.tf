variable "aws_vpc_id" {}

variable "alltag" {}

variable "aws_igw_id" {}

variable "aws_nat_instance_id" {}

variable "aws_public_subnet_id" {}

variable "aws_private_subnet_id" {}

variable "aws_public_subnet" {}

variable "aws_private_subnet" {}

locals {
  company_name = var.alltag
  vpc_id = var.aws_vpc_id
  private_subnet = var.aws_private_subnet
  public_subnet = var.aws_public_subnet
  igw_id = var.aws_igw_id
  nat_instance_id = var.aws_nat_instance_id
  public_subnet_id = var.aws_public_subnet_id
  private_subnet_id = var.aws_private_subnet_id

}