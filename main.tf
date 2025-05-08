resource "aws_instance" "this" {
  for_each      = var.instances
  ami           = each.value.ami_id
  instance_type = each.value.instance_type
  subnet_id     = each.value.subnet_id

  tags = merge(
    {
      Name = each.key
    },
    each.value.tags
  )

user_data = <<-EOF
              #!/bin/bash
              hostnamectl set-hostname ${each.key}
              echo "${each.key}" > /etc/hostname
              sed -i "/127.0.1.1/d" /etc/hosts
              echo "127.0.1.1 ${each.key}" >> /etc/hosts
              echo "preserve_hostname: true" >> /etc/cloud/cloud.cfg
            EOF

}

