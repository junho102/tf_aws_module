output "web_launch_template_id" {
    value = aws_launch_template.webfarm.id
}

output "was_launch_template_id" {
  value = aws_launch_template.wasfarm.id
}
