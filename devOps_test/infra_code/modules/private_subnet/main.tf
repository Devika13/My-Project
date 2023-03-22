
resource "aws_subnet" "private_subnet" {
  vpc_id                  = var.vpc_id
  count                   = length(var.private_subnets_cidr)
  cidr_block              = element(var.private_subnets_cidr, count.index)
  availability_zone       = element(var.availability_zones, count.index)
  map_public_ip_on_launch = false

  tags = {
    Name        = "${var.environment}-${element(var.availability_zones, count.index)}-private-subnet"
    Environment = "${var.environment}"
  }
}

resource "aws_route_table" "private_rt" {
 vpc_id = var.vpc_id
 
 route {
   cidr_block = "0.0.0.0/0"
   gateway_id = var.natgateway_id
 }
 
 tags = {
   Name = "${var.environment}-octopus-private-routetable"
 }
}

resource "aws_route_table_association" "private_subnet_asso" {
 count = length(var.private_subnets_cidr)
 subnet_id      = element(aws_subnet.private_subnet[*].id, count.index)
 route_table_id = aws_route_table.private_rt.id
 
 }
