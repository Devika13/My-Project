output "natgateway_id" {
  value = aws_nat_gateway.nat.id
}

output "public_subnet_id" {
  value = aws_subnet.public_subnet[*].id

}

