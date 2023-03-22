provider "aws" {
  region     = var.region
  access_key = var.AWS_ACCESS_KEY
  secret_key = var.AWS_SECRET_KEY
}

terraform {
  backend "s3" {
    bucket = "terraform-backend-2103"
    key    = "terraform-state"
    region = "us-east-1"
  }
}