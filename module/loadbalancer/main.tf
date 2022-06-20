
//=================web=======================
resource "aws_lb_target_group" "web_target_group" {
  name = "web-target-group"
  port = 80
  protocol = "HTTP"
  vpc_id = local.vpc_id

  health_check {
    interval = 30
    path = "/"
    healthy_threshold = 3
    unhealthy_threshold = 3
  }

  tags = { Name = "${local.company_name}-WEB Target Group" }
}


resource "aws_lb" "web_alb" {
  name = "web-alb"
  internal = false
  load_balancer_type = "application"
  security_groups = local.alb_external_sg_id
  subnets = [local.public_subnet_id[0], local.public_subnet_id[1]]

#   access_logs {
#       bucket = "${aws_s3_bucket.alb.id}"
#       prefix = "~~"
#       enabled = true
#   }

  tags = { Name = "${local.company_name}-WEB ALB" }
}


resource "aws_lb_listener" "web_alb_listener" {
  load_balancer_arn = aws_lb.web_alb.arn
  port = "80"
  protocol = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.web_target_group.arn
  }
}


//=================was=======================
resource "aws_lb_target_group" "was_target_group" {
  name = "was-target-group"
  port = 8080
  protocol = "HTTP"
  vpc_id = local.vpc_id

  stickiness {
    #type = "app_cookie"
		type = "lb_cookie"
    enabled = "true"
    # cookie_name = "Cookie"
    cookie_duration = 86400
  }

  health_check {
    interval = 30
    path = "/"
    healthy_threshold = 3
    unhealthy_threshold = 3
  }

  tags = { Name = "${local.company_name}-WAS Target Group" }
}


resource "aws_lb" "was_alb" {
  name = "was-alb"
  internal = true
  load_balancer_type = "application"
  security_groups = local.alb_internal_sg
  subnets = [local.private_subnet_id[2], local.private_subnet_id[3]]

  tags = { Name = "${local.company_name}-WAS ALB" }
}


resource "aws_lb_listener" "was_alb_listener" {
  load_balancer_arn = aws_lb.was_alb.arn
  port = "8080"
  protocol = "HTTP"
  
  default_action {
    type = "forward"
    forward {
      target_group {
        arn = aws_lb_target_group.was_target_group.arn
        weight = 1
      }
      stickiness {
        enabled = "true"
        duration = "300"
      }
    }
  }
}

