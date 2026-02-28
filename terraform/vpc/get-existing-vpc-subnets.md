# Existing VPC and Subnets

### Get VPC and Subnet Information
```tf
provider "aws" {
    region = "ap-southeast-1"
}


data "aws_vpc" "existing" {
  filter {
    name   = "tag:Name"
    values = ["MyProject-vpc"]
  }
}

data "aws_subnets" "vpc_subnets" {
    filter {
        name = "vpc-id"
        values = [data.aws_vpc.existing.id]
    }
}

output "existing_vpc_id" {
    value = data.aws_vpc.existing.id
}

output "vpc_subnets_list" {
    value = data.aws_subnets.vpc_subnets.ids
}
```
