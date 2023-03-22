resource "aws_subnet" "public_subnet" {
  vpc_id                  = var.vpc_id
  count                   = length(var.public_subnets_cidr)
  cidr_block              = element(var.public_subnets_cidr, count.index)
  availability_zone       = element(var.availability_zones, count.index)
  map_public_ip_on_launch = true

  tags = {
    Name        = "${var.environment}-${element(var.availability_zones, count.index)}-octopus-public-subnet"
    Environment = "${var.environment}"
  }
}

resource "aws_route_table_association" "public_subnet_asso" {
 count = length(var.public_subnets_cidr)
 subnet_id      = element(aws_subnet.public_subnet[*].id, count.index)
 route_table_id = var.public_rt
}

resource "aws_eip" "nat_eip" {
  vpc        = true
  
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = element(aws_subnet.public_subnet.*.id, 0)
  
 
  tags = {
    Name        = "${var.environment}-octopus-nat"
    Environment = "${var.environment}"
  }
}