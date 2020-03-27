variable "custom_tags" {
  description = "Custom tags to set on the Instances in the ASG"
  type        = map(string)
  default = {
    "foo" = "bar"
    "faz" = "baz"
  }
}
