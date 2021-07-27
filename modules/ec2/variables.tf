
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

variable "subnet_id" {
  type = string
  description = "subnet_id"
}