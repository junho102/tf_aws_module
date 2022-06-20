resource "aws_subnet" "public" {
  count = length(local.public_subnet)
  vpc_id                  = local.vpc_id
  cidr_block              = element(local.public_subnet,count.index)
  availability_zone       = ((count.index)%2)==0? local.zone_id_a : local.zone_id_c
  
  tags = { 
    Name = "${local.company_name}-snet-public-${((count.index)%2)==0? "a" : "c"}"
  }
}

resource "aws_subnet" "private" {
  count = length(local.private_subnet)
  vpc_id                  = local.vpc_id
  cidr_block              = element(local.private_subnet,count.index)
  availability_zone       = ((count.index)%2)==0? local.zone_id_a : local.zone_id_c
  
  tags = { 
    Name = "${local.company_name}-snet-private${(count.index)+1}-${((count.index)%2)==0? "a" : "c"}"
  }
}