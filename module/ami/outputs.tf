output "ubuntu_20_04_ami_id" {
    value = data.aws_ami.ubuntu2004.id
}

output "nat_instance_ami_id" {
    value = data.aws_ami.nat_instance_ami.id
}
