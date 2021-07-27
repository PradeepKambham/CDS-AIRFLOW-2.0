provider "aws" {
  region                  = "us-east-1"
  shared_credentials_file = "/Users/prade/.aws/credentials"
  profile                 = "customprofile"
}

resource "aws_vpc" "main" {
  cidr_block ="10.0.0.0/16"
}

module "pradeep_webserver" {
  source = "../modules/ec2"
  vpc_id= "${local.vpc_id}"
  subnet_cidr_block="10.0.1.0/24"
  ami="ami-0dc2d3e4c0f9ebd18"
  instance_type="t2.micro"
  webserver_name="pradeep"
}