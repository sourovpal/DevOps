provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "private_sg" {
  name        = "private-sg"
  description = "Private security group for internal resources"
  vpc_id      = "vpc-12345678"
  
  ingress {
    from_port       = 0
    to_port         = 65535
    protocol        = "tcp"
    security_groups = [aws_security_group.private_sg.id]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["10.0.0.0/16"]
  }

  tags = {
    Name = "private-sg"
  }
}
