variable "aws_private_subnet" {}
variable "aws_public_subnet" {}

variable "alltag" {}

variable "aws_vpc_id" {}
variable "was_alb_id" {}

# variable "aws_bastion_instance_privateip" {}

locals {
  company_name = var.alltag
  vpc_id = var.aws_vpc_id
  private_subnet = var.aws_private_subnet

  public_subnet = var.aws_public_subnet
  was_alb_id = var.was_alb_id

  # bastion_instacne_privateip = var.aws_bastion_instance_privateip
}