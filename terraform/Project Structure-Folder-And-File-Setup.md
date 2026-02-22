# Project Structure

# ✅ 1️⃣ `main.tf`

এটা হলো মূল configuration file। এখানে resources, provider, modules define করা হয়।

Example:

```hcl
provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_instance" "example" {
  ami           = "ami-123456"
  instance_type = "t2.micro"
}
```

---

# ✅ 2️⃣ `variables.tf`

এখানে সব input variable define করা হয়।

```hcl
variable "region" {
  description = "AWS Region"
  type        = string
  default     = "ap-southeast-1"
}
```

---

# ✅ 3️⃣ `terraform.tfvars`

এখানে variable এর value assign করা হয়।

```hcl
region = "us-east-1"
```

👉 Sensitive data (password, key) এখানে রাখলে ভালো practice হলো `.gitignore` করা।

---

# ✅ 4️⃣ `outputs.tf`

এখানে output define করা হয়।

```hcl
output "instance_ip" {
  value = aws_instance.example.public_ip
}
```

---

# ✅ 5️⃣ `provider.tf` (optional)

Provider আলাদা file এ রাখা যায়।

```hcl
provider "aws" {
  region = var.region
}
```

Provider example: Terraform AWS Provider

---

# ✅ 6️⃣ `backend.tf`

Remote state configure করার জন্য।

Example (S3 backend):

```hcl
terraform {
  backend "s3" {
    bucket = "my-terraform-state"
    key    = "dev/terraform.tfstate"
    region = "ap-southeast-1"
  }
}
```

এটা সাধারণত Amazon S3 + Amazon DynamoDB lock এর সাথে ব্যবহার হয়।

---

# ✅ 7️⃣ `terraform.tfstate` (Auto Generated)

Terraform apply করলে auto generate হয়।

⚠️ এটা manually edit করা যাবে না।

---

# ✅ 8️⃣ `.terraform/` folder

terraform init করলে create হয়।

এখানে:

* provider plugins
* modules
* lock file

থাকে।

---

# ✅ 9️⃣ `terraform.lock.hcl`

Provider version lock করার জন্য।

---

# 🔥 Professional Project Structure (Mid-Level DevOps)

```
terraform-project/
│
├── main.tf
├── variables.tf
├── outputs.tf
├── provider.tf
├── backend.tf
├── terraform.tfvars
├── modules/
│     ├── vpc/
│     ├── ec2/
│     └── eks/
└── environments/
      ├── dev/
      ├── staging/
      └── prod/
```
