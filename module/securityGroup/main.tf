data "http" "myip" {
  url = "http://ipv4.icanhazip.com"
}

resource "aws_security_group" "nat_instance_sg" {
  vpc_id = local.vpc_id
  name = "natInstance_sg"

  tags = { Name = "${local.company_name}-NAT Instance SG" }
  
  ingress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = [local.private_subnet[0],
                    local.private_subnet[1],
                    local.private_subnet[2],
                    local.private_subnet[3],
                    local.private_subnet[4],
                    local.private_subnet[5]]
  }

  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_security_group" "bastion_instance_sg" {
  vpc_id = local.vpc_id
  name = "bastionInstance_sg"

  tags = { Name = "${local.company_name}-Bastion Instance SG" }
  
  ingress {
      description = "ssh"
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["${chomp(data.http.myip.body)}/32"]
  }

  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }
}



resource "aws_security_group" "web_instance_sg" {
  vpc_id = local.vpc_id
  name = "webInstance_sg"

  tags = { Name = "${local.company_name}-WEB Instance SG" }
  
  ingress {
      description = "ssh"
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = [local.public_subnet[0]]
  }

  ingress {
      description = "http"
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_security_group" "alb_external_sg" {
  vpc_id = local.vpc_id
  name = "alb-external-sg"

  tags = { Name = "${local.company_name}-ALB External SG" }
  
  ingress {
      description = "http"
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "alb_internal_sg" {
  vpc_id = local.vpc_id
  name = "alb-internal-sg"

  tags = { Name = "${local.company_name}-ALB Internal-SG" }
  
  ingress {
      description = "http"
      from_port = 8080
      to_port = 8080
      protocol = "tcp"
      cidr_blocks = [local.private_subnet[0],
                    local.private_subnet[1]]
  }
  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_security_group" "was_instance_sg" {
  vpc_id = local.vpc_id
  name = "wasInstance_sg"

  tags = { Name = "${local.company_name}-WAS Instance SG" }
  
  ingress {
      description = "ssh"
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = [local.public_subnet[0]]
  }

  ingress {
      description = "http"
      from_port = 8080
      to_port = 8080
      protocol = "tcp"
      security_groups = [aws_security_group.alb_internal_sg.id]
  }

  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }
}