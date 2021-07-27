resource "aws_vpc" "main" {
  cidr_block =var.vpc_cidr_block
}

resource "aws_subnet" "webserver" {
  vpc_id     = "${local.vpc_id}"
  cidr_block = var.subnet_cidr_block

  tags = {
    Name = "Main"
  }
}

resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id = aws_subnet.webserver.id


  tags = {
    Name = "${var.webserver_name}webserver"
  }
}

