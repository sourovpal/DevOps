# AWS EKS (Elastic Kubernetes Service)
এটি Amazon Web Services (AWS) দ্বারা পরিচালিত managed Kubernetes service। সহজ কথায়, এটি Kubernetes ক্লাস্টার তৈরি, চালানো এবং স্কেল করার কাজকে অনেক সহজ করে দেয়।

### Create Cluster

```bash
aws eks create-cluster \
    --name my-cluster \
    --role-arn arn:aws:iam::123456789012:role/EKSRole \
    --resources-vpc-config subnetIds=subnet-abc,subnet-def,securityGroupIds=sg-123
```
