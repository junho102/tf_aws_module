output "aws_vpc_id" {
  value = aws_vpc.vpc.id
}

output "aws_igw_id" {
  value = aws_internet_gateway.igw.id
}