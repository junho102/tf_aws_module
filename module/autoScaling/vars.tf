variable "alltag" {}
variable "web_launch_template_id" {}
variable "aws_private_subnet_id" {}
variable "web_target_group_arn" {}
variable "was_target_group_arn" {}
variable "was_launch_template_id" {}

locals {
  company_name = var.alltag
  web_launch_template_id = var.web_launch_template_id
  was_launch_template_id = var.was_launch_template_id
  private_subnet_id = var.aws_private_subnet_id
  web_target_group_arn = var.web_target_group_arn
  was_target_group_arn = var.was_target_group_arn
}