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


output "vpc_id" {
  value = "${aws_vpc.main.id}"
}

output "subnet_id" {
  value = "${aws_subnet.webserver.id}"
}