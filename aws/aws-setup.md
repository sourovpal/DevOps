# 💻 AWS Setup CLI Local Computer

### 👤 Create IAM User
```bash
Login AWS Console Account ➡️ IAM ➡️ Users ➡️ Create User ➡️ Input User Details ➡️ Save Change
```

### 🧩 AWS Cli Download
```bash
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

sudo apt install unzip
unzip awscliv2.zip

sudo ./aws/install
aws --version
```

### 🧩 AWS Cli Configure
```bash
aws configure

# Input your credentials

AWS Access Key ID []: aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
AWS Secret Access Key []: bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
default region name []: ap-east-1
Default output format []: json
```

### 🧩 AWS configure list
```bash
aws configure list     # Show Access key, secret key, region, profile
aws configure list-profiles     # সব saved profiles দেখাবে।
```

### 🧩 Show configure details
```bash
cat ~/.aws/config
cat ~/.aws/credentials
```
