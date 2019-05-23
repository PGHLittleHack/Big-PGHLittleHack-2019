variable "access_key" {
  type = "string"
}
variable "secret_key" {
  type = "string"
}

provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-b374d5a5"
  instance_type = "t2.micro"
}

resource "aws_instance" "example1" {
  ami           = "ami-2757f631"
  instance_type = "t2.micro"
}