variable "instances" {
  description = "Map of EC2 instances to create with their configurations"
  type = map(object({
    instance_type = string
    subnet_id     = string
    ami_id        = string
    tags          = map(string)
  }))
}

