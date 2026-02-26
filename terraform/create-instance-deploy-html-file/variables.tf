
variable "aws_region" {
    description = "AWS Region"
    type = string
}

variable "ami_id" {
    description = "Ubuntu AMI ID"
    type = string
}

variable "instance_type" {
    description = "EC2 instance type"
    type = string
    default = "t2.micro"
}

variable "key_name" {
    description = "Key pair name"
    type = string
}

variable "public_key_path" {
    description = "Path to public key"
    type = string
}

variable "private_key_path" {
    description = "Path to private key"
    type = string
}

variable "website_path" {
    description = "Local Website folder path"
    type = string
}

variable "ssh_user" {
    description = "SSH username"
    type = string
    default = "ubuntu"
}

variable "security_group_name" {
    description = "Existing security group name"
    type = string
    default = "default"
}
