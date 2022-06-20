resource "aws_route_table" "route_table_public" {
  vpc_id = local.vpc_id
  tags = { Name = "${local.company_name}-Public Route Table" }
}

resource "aws_route_table" "route_table_private" {
  vpc_id = local.vpc_id
  tags = { Name = "${local.company_name}-Private Route Table" }
}

resource "aws_route" "public_route" {
  route_table_id = aws_route_table.route_table_public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = local.igw_id
}

resource "aws_route" "private_route" {
  route_table_id = aws_route_table.route_table_private.id
  destination_cidr_block = "0.0.0.0/0"
  instance_id = local.nat_instance_id
}

resource "aws_route_table_association" "public_asso_rt" {
  count = length(local.public_subnet)

  subnet_id = element(local.public_subnet_id, count.index)
  route_table_id = aws_route_table.route_table_public.id
}

resource "aws_route_table_association" "private_asso_rt" {
  count = length(local.private_subnet)

  subnet_id = element(local.private_subnet_id, count.index)
  route_table_id = aws_route_table.route_table_private.id
}