output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "public_rt" {
  value = aws_route_table.public_rt.id
}