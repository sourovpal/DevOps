# 🎯 Terraform SSH Key Pair

### ✅ Generate SSH Key
```bash
ssh-keygen -t rsa -b 4096 -f ~/.ssh/my-key -N ""
```

### ✅ Terraform Code:
`main.tf`
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

### ✅ Terraform দিয়ে সরাসরি Key Generate করা (Advanced)
```tf
resource "tls_private_key" "example" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated" {
  key_name   = "generated-key"
  public_key = tls_private_key.example.public_key_openssh
}

output "private_key" {
  value     = tls_private_key.example.private_key_pem
  sensitive = true
}
```
⚠️ Note: এভাবে করলে private key Terraform state-এ থেকে যায় — production এ recommended না।

### ✅ Run
```bash
terraform init
terraform apply
terraform apply -auto-approve
```
