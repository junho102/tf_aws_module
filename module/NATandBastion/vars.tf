
variable "alltag" {}

variable "aws_public_subnet_id" {}

# variable "aws_private_subnet_id" {}

variable "aws_nat_instance_sg_id" {}

variable "aws_bastion_instance_sg_id" {}

variable "ubuntu_20_04_ami_id" {}

variable "nat_instance_ami_id" {}


locals {
  company_name = var.alltag
  public_subnet_id = var.aws_public_subnet_id
  # private_subnet_id = var.aws_private_subnet_id
  nat_instance_sg_id = var.aws_nat_instance_sg_id
  bastion_instance_sg_id = var.aws_bastion_instance_sg_id
  ubuntu_20_04_ami_id = var.ubuntu_20_04_ami_id
  nat_instance_ami_id = var.nat_instance_ami_id
}