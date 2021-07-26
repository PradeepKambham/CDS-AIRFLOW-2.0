provider "aws" {
  region                  = "us-east-1"
  shared_credentials_file = "/Users/prade/.aws/credentials"
  profile                 = "customprofile"
}

resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "demo"
  }
}