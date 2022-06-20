output "web_target_group_arn" {
  value = aws_lb_target_group.web_target_group.arn
}

output "was_target_group_arn" {
  value = aws_lb_target_group.was_target_group.arn
}

output "was_alb_id" {
  value = aws_lb.was_alb.*.id
}