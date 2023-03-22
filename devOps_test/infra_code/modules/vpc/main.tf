resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name        = "${var.environment}-octopus-vpc"
    Environment = var.environment
  }
}

resource "aws_internet_gateway" "gw" {
 vpc_id = aws_vpc.vpc.id
 
 tags = {
   Name = "${var.environment}-octopus-ig"
 }
}

resource "aws_route_table" "public_rt" {
 vpc_id = aws_vpc.vpc.id
 
 route {
   cidr_block = "0.0.0.0/0"
   gateway_id = aws_internet_gateway.gw.id
 }
 
 tags = {
   Name = "${var.environment}-octopus-public-routetable"
 }
}