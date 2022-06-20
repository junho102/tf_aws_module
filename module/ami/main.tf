data "aws_ami" "ubuntu2004" {
  most_recent = true         #최신 ami가져옴

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical (우분투를 만든회사에 대해서만 ami가져옴)
}


data "aws_ami" "nat_instance_ami" {
  most_recent = true         #최신 ami가져옴

  filter {
    name   = "name"
    values = ["amzn-ami-vpc-nat-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["137112412989"] 
}