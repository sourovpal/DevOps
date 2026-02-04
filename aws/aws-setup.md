# AWS Setup CLI Local Computer

### Create IAM User


### Aws Cli Download
```bash
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

sudo apt install unzip
unzip awscliv2.zip

sudo ./aws/install
aws --version
```

### AWS Cli Configure
```bash
aws configure
```

### Aws configure list
```bash
aws configure list     # Show Access key, secret key, region, profile
aws configure list-profiles     #  সব saved profiles দেখাবে।
```

### Show configure details
```bash
cat ~/.aws/config
cat ~/.aws/credentials
```
