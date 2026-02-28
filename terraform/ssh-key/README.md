# Terraform SSH Key Pair

### ✅ Generate SSH Key
```bash
ssh-keygen -t rsa -b 4096 -f ~/.ssh/my-key -N ""
```

### ✅ Terraform Code:
```tf
provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_key_pair" "my_key" {
  key_name   = "my-ec2-key"
  public_key = file("my-key.pub")

  tags = {
    Name = "my-ec2-key"
  }
}
```
