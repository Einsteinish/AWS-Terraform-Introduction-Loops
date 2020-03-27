output "instance_ip_addresses" {
  # Result is a map from instance id to private and public IP addresses, such as:
  #  {"i-1234" = ["192.168.1.2","54.234.188.251,] "i-5678" = ["192.168.1.5","3.90.189.190",] }
  value = {
    for instance in aws_instance.server:
      instance.id => [instance.private_ip, instance.public_ip]
  }
}

