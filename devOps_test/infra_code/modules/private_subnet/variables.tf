variable "private_subnets_cidr" {
  type        = list
  description = "CIDR block for Private Subnet"
}

variable "availability_zones" {
  type        = list
  description = "AZ in which all the resources will be deployed"
}

variable "environment" {
  description = "Deployment Environment"
}

variable "vpc_id"{
  description = "VPC ID in which subnet will be created"
}

variable "natgateway_id" {
  description = "NAT gateway ID to add route in private routetable"
}