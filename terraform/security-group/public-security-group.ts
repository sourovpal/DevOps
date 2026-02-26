provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "public_sg" {
  name        = "my-security-group"
  description = "My custom security group"
  vpc_id      = "vpc-12345678"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "my-security-group"
  }
}

output "public_sg_id" {
  description = "The ID of the Security Group"
  value       = aws_security_group.public_sg.id
}
