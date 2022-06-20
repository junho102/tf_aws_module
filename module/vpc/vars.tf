variable "alltag" {}

variable "vpc_cidr" {}

locals {
  company_name = var.alltag
  aws_vpc_cidr = var.vpc_cidr
}