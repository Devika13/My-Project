variable "public_subnets_cidr" {
  type        = list
  description = "CIDR block for Public Subnet"
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

variable "public_rt" {
  description = "Public route table ID for associating it to subnet"
}