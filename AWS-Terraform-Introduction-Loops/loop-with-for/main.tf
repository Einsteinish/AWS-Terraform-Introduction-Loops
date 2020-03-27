terraform {
  required_version = ">= 0.12"
}

provider "aws" {
  region = "us-east-1"
}


resource "aws_instance" "server" {
  count = var.instances

  ami           = "ami-07ebfd5b3428b6f4d"
  instance_type = "t2.nano"

  tags = {
    Name = "Server ${count.index}"
  }
}
