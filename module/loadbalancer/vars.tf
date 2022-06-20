variable "alltag" {}
variable "aws_vpc_id" {}
variable "aws_public_subnet_id" {}
variable "aws_private_subnet_id" {}
variable "aws_alb_external_sg_id" {}
variable "aws_alb_internal_sg" {}

locals {
  company_name = var.alltag
  vpc_id = var.aws_vpc_id
  public_subnet_id = var.aws_public_subnet_id
  private_subnet_id = var.aws_private_subnet_id
  alb_external_sg_id = var.aws_alb_external_sg_id
  alb_internal_sg = var.aws_alb_internal_sg
}