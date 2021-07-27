variable "vpc_id" {
  type=string
}



variable "subnet_cidr_block" {
   type = string
  description = "subnet cidr_block"
}

variable "ami" {
  type = string
  description = "webserver ami_id"
}
variable "instance_type" {
   type = string
  description = "webserver type"
}

variable "webserver_name" {
  type = string
  description = "webserver_name"
}

