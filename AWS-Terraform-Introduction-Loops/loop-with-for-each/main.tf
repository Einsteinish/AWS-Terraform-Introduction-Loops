terraform {
  required_version = ">= 0.12"
}

provider "aws" {
  region = "us-east-1"
}

data "aws_availability_zones" "all" {}

resource "aws_autoscaling_group" "example" {
  launch_configuration = aws_launch_configuration.example.id
  availability_zones   = data.aws_availability_zones.all.names

  min_size = 2
  max_size = 2

  # Use for_each to loop over var.custom_tags
  dynamic "tag" {
    for_each = var.custom_tags
    content {
      key                 = tag.key
      value               = tag.value
      propagate_at_launch = true
    }
  }
}

resource "aws_launch_configuration" "example" {
  image_id        = "ami-07ebfd5b3428b6f4d"
  instance_type   = "t2.nano"

  lifecycle {
    create_before_destroy = true
  }
}
