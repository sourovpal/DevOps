provider "aws" {
    region = var.aws_region
}

data "aws_vpc" "default" {
  default = true
}

data "aws_security_group" "default" {
    name = var.security_group_name
    vpc_id = data.aws_vpc.default.id
}

resource "aws_key_pair" "deployer" {
  key_name   = var.key_name
  public_key = file(var.public_key_path)
}

resource "aws_security_group_rule" "default_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = data.aws_security_group.default.id
}

resource "aws_security_group_rule" "default_http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = data.aws_security_group.default.id
}

resource "aws_instance" "web" {
    ami                     = var.ami_id
    instance_type           = var.instance_type
    key_name                = var.key_name
    vpc_security_group_ids  = [data.aws_security_group.default.id]

    tags = {
        Name = "My-Instance"
    }

    user_data = <<-EOF
    #!/bin/bash
    apt update -y
    apt install -y nginx
    systemctl start nginx
    EOF

    provisioner "remote-exec" {
        inline = [
            "sudo mkdir -p /var/www/html",
            "sudo chown ubuntu:ubuntu /var/www/html"
        ]

        connection {
            type        = "ssh"
            user        = var.ssh_user
            private_key = file(var.private_key_path)
            host        = self.public_ip
        }
    }

    provisioner "file" {
        source      = var.website_path
        destination = "/var/www/html/"

        connection {
            type        = "ssh"
            user        = var.ssh_user
            private_key = file(var.private_key_path)
            host        = self.public_ip
        }
    }

}
