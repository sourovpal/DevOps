# Elastic Kubernetes Service

### Show cluster list
```bash
aws eks list-clusters --region ap-southeast-1
```

### Show all cluster list any region
```bash
for region in $(aws ec2 describe-regions --query "Regions[].RegionName" --output text); do
  echo "# Region: $region"
  aws eks list-clusters --region $region --output table
done
```
