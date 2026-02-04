# AWS S3 Bucket
### Create S3 Bucket

```bash
aws s3api create-bucket \
  --bucket <bucket-name> \
  --region ap-east-1 \
  --create-bucket-configuration LocationConstraint=ap-east-1

# Output
{
    "Location": "http://<bucket-name>.s3.amazonaws.com/",
    "BucketArn": "arn:aws:s3:::<bucket-name>"
}
```

### 🧩 S3 Bucket **Public Read Enable**
**S3 → Your Bucket → Permissions**

- Block public access → Edit
- ❌ সব checkbox আনচেক করুন
- Save changes

### 🧩 Add Bucket Policy
**Permissions → Bucket policy → Edit**
```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "PublicReadGetObject",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::YOUR_BUCKET_NAME/*"
    }
  ]
}
```

### 🧩 Laravel S3 file Upload and Delete

```env
AWS_ACCESS_KEY_ID=xxxx
AWS_SECRET_ACCESS_KEY=xxxx
AWS_DEFAULT_REGION=ap-south-1
AWS_BUCKET=my-bucket
AWS_URL=https://my-bucket.s3.ap-south-1.amazonaws.com
```

`config/filesystems.php`
```php
's3' => [
    'driver' => 's3',
    'key' => env('AWS_ACCESS_KEY_ID'),
    'secret' => env('AWS_SECRET_ACCESS_KEY'),
    'region' => env('AWS_DEFAULT_REGION'),
    'bucket' => env('AWS_BUCKET'),
    'url' => env('AWS_URL'),
],
```

### 🧩 AWS Access Key & Secret Key পেতে

- Step 1: AWS Console → IAM

- Step 2: User তৈরি করুন (যদি আগে না থাকে)
  - Users → Add users
  - Username দিন (যেমন: soruov-admin)
  - Access type:
  - ✅ Programmatic access (CLI, API, SDK এর জন্য)
  - ❌ Console access দরকার না হলে unchecked

- Step 3: Permission attach করুন
  - Direct attach policy: AmazonS3FullAccess (development purpose)
  - Production হলে least privilege principle ফলো করুন

- Step 4: User তৈরি করলে Key পাবেন
  - Access key ID → AWS_ACCESS_KEY_ID
  - Secret access key → AWS_SECRET_ACCESS_KEY
  - 💡 Secret key একবারই দেখানো হবে, save করে রাখুন

### 🧩 Admin role কে allow করা
Bucket Policy তে Deny → যে কেউ access পাবে না, এমনকি Admin IAM এর Allow থাকলেও , আপনি চাইলে Condition দিয়ে exceptions set করতে পারেন
```json
{
  "Effect": "Deny",
  "Action": "s3:*",
  "Resource": "arn:aws:s3:::my_bucket/private/*",
  "Condition": {
    "StringNotEquals": {
      "aws:username": "admin-user"
    }
  }
}
```
- ✅ এখন শুধু `Username: admin-user` Deny এর আওতায় পড়বে না


### 🧩 Public access only Read and Download | IAM User Update and Delete Policy

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "PublicReadGetObject",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::YOUR_BUCKET_NAME/*"
    },
    {
      "Sid": "IAMUpdateDelete",
      "Effect": "Allow",
      "Principal": { "AWS": "*" },
      "Action": [
        "s3:PutObject",
        "s3:DeleteObject"
      ],
      "Resource": "arn:aws:s3:::YOUR_BUCKET_NAME/*",
      "Condition": {
        "StringNotEqualsIfExists": {
          "aws:username": "public-user"
        }
      }
    }
  ]
}
```
