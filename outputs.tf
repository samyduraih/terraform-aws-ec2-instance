output "instances" {
  description = "Map of instance names to their IDs and private IPs"
  value = {
    for k, v in aws_instance.this : k => {
      id         = v.id
      private_ip = v.private_ip
    }
  }
}

