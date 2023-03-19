variable "region" {
  default = "ap-south-1"
}

variable "http_port" {
  default = 80
}

variable "ssh_port" {
  default = 22
}

variable "my_system" {
  default = "202.91.70.183/32"
}

variable "ami" {
  default = "ami-0cca134ec43cf708f"
}

variable "instance_type" {
  default = "t2.micro"
}