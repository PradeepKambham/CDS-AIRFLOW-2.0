
resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  iam_instance_profile = var.ec2_profile


  tags = {
    Name = "${var.webserver_name}webserver"
  }
}

