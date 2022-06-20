resource "aws_instance" "NAT_instacne" {
  # ami = "ami-001e4628006fd3582"
  # ami = data.aws_ami.nat_instance_ami.id
  ami = local.nat_instance_ami_id
  instance_type = "t2.micro"
  associate_public_ip_address = true
  source_dest_check = false
  subnet_id = local.public_subnet_id[0]
  vpc_security_group_ids = local.nat_instance_sg_id
  
  tags = { Name = "${local.company_name}-NAT Instance" }
}

resource "aws_instance" "Bastion_instacne" {
  # ami = "ami-020db2c14939a8efb"
  ami = local.ubuntu_20_04_ami_id
  instance_type = "t2.micro"
  associate_public_ip_address = true
  subnet_id = local.public_subnet_id[0]
  vpc_security_group_ids = local.bastion_instance_sg_id
  key_name = "bastion_key"
  
  tags = { Name = "${local.company_name}-Bastion Instance" }
}

# resource "aws_instance" "WEB_instance" {
#   # ami = "ami-020db2c14939a8efb"
#   # instance_type = "t2.micro"
  
#   # vpc_security_group_ids = local.web_instance_sg_id
#   launch_template {
#     id = local.web_launch_template_id
#     version = 1
#   }
#   subnet_id = local.private_subnet_id[0]
  
  
#   # key_name = "febeserver_key"

#   tags = { Name = "${local.company_name}-WEB Instance" }

# }

