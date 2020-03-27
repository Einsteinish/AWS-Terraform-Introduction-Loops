terraform {
  required_version = ">= 0.12"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_user" "users" {
  count = length(var.user_names)
  name  = var.user_names[count.index]
}
