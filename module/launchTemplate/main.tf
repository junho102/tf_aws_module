resource "aws_launch_template" "webfarm" {
  name = "web_config"
  # image_id = data.aws_ami.ubuntu2004.id
  image_id = local.ubuntu_20_04_ami_id
  instance_type = "t2.micro"
  vpc_security_group_ids = local.web_instance_sg_id
  user_data = filebase64("${path.module}/web.sh")
  key_name = "febeserver_key"
}

resource "aws_launch_template" "wasfarm" {
  name = "was_config"
  image_id = local.ubuntu_20_04_ami_id
  instance_type = "t2.micro"
  vpc_security_group_ids = local.was_instance_sg_id
  user_data = filebase64("${path.module}/was.sh")
  key_name = "febeserver_key"
}