variable "alltag" {}

variable "aws_web_instance_sg_id" {}
variable "aws_was_instance_sg_id" {}

variable "ubuntu_20_04_ami_id" {}

locals {
  company_name = var.alltag
  web_instance_sg_id = var.aws_web_instance_sg_id
  was_instance_sg_id = var.aws_was_instance_sg_id
  ubuntu_20_04_ami_id = var.ubuntu_20_04_ami_id
}