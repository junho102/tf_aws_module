output "aws_nat_instance_sg_id" {
  value = aws_security_group.nat_instance_sg.*.id
}

output "aws_bastion_instance_sg_id" {
  value = aws_security_group.bastion_instance_sg.*.id
}

output "aws_web_instance_sg_id" {
  value = aws_security_group.web_instance_sg.*.id
}

output "aws_was_instance_sg_id" {
  value = aws_security_group.was_instance_sg.*.id
}

output "aws_alb_external_sg_id" {
  value = aws_security_group.alb_external_sg.*.id
}

output "aws_alb_internal_sg_id" {
  value = aws_security_group.alb_internal_sg.*.id
}