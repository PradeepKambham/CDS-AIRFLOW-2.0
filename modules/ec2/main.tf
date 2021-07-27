resource "aws_vpc" "main" {
  cidr_block =var.vpc_cidr

}
resource "aws_subnet" "webserver" {
  vpc_id     = var.vpc_id
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

output "vpc_id" {
  value = "${aws_vpc.main.id}"
}