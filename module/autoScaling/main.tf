resource "aws_autoscaling_group" "web_asg" {
  launch_template {
    id = local.web_launch_template_id
    #version = "$Latest"
    version = "$Default"
  }

  name = "${local.company_name}-WEB-ASG"

  desired_capacity = 2
  min_size = 2
  max_size = 4
  vpc_zone_identifier = [local.private_subnet_id[0],
                        local.private_subnet_id[1]]

  target_group_arns = [local.web_target_group_arn]
  health_check_grace_period = 300
  #health_check_type         = "ELB"

  

  tag {
    key = "Name"
    value = "${local.company_name}-WEB Instance"
    propagate_at_launch = true
  }
}


resource "aws_autoscaling_group" "was_asg" {
  launch_template {
    id = local.was_launch_template_id
    #version = "$Latest"
    version = "$Default"
  }

  name = "${local.company_name}-WAS-ASG"

  desired_capacity = 2
  min_size = 2
  max_size = 4
  vpc_zone_identifier = [local.private_subnet_id[2],
                        local.private_subnet_id[3]]

  target_group_arns = [local.was_target_group_arn]
  health_check_grace_period = 300
  #health_check_type         = "ELB"

  

  tag {
    key = "Name"
    value = "${local.company_name}-WAS Instance"
    propagate_at_launch = true
  }
}