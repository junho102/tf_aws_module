output "aws_nat_instance_id" {
  value = aws_instance.NAT_instacne.id
}

# output "aws_bastion_instance_privateip"{
#   value = aws_instance.Bastion_instacne.private_ip
# }