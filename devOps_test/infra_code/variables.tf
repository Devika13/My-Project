variable "AWS_ACCESS_KEY" {
  description = "AWS access key"  
}

variable "AWS_SECRET_KEY" {
  description = "AWS secret key"
}

variable "region" {
  default = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR block of the vpc"
  default     = "10.0.0.0/16"
}

variable "public_subnets_cidr" {
  type        = list(any)
  description = "CIDR block for Public Subnet"
  default     = ["10.0.0.0/20","10.0.32.0/20"]
}

variable "private_subnets_cidr" {
  type        = list(any)
  description = "CIDR block for Private Subnet"
  default     = ["10.0.16.0/20"]
}

variable "availability_zones" {
  type        = list(any)
  description = "AZ in which all the resources will be deployed"
  default     = ["us-east-1a","us-east-1b"]
}

variable "environment" {
  description = "Deployment Environment"
  default     = "dev"
}