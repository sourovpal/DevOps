# 💽 AWS S3 Bucket
### 🧩 Create S3 Bucket

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
### 🧩 Public access block disable
```bash
aws s3api put-public-access-block \
  --bucket my-public-bucket-12345 \
  --public-access-block-configuration \
  "BlockPublicAcls=false,IgnorePublicAcls=false,BlockPublicPolicy=false,RestrictPublicBuckets=false"
```
##### ডিফল্টভাবে AWS public access block করে রাখে।

| Option                | Value | অর্থ                                                                                                  |
| --------------------- | ----- | ----------------------------------------------------------------------------------------------------- |
| BlockPublicAcls       | false | ACL-এর মাধ্যমে public access block করা হবে না। অর্থাৎ তুমি যদি ACL দিয়ে public দেন, সেটা allowed হবে। |
| IgnorePublicAcls      | false | public ACL ignore করা হবে না। অর্থাৎ public ACL active থাকবে।                                         |
| BlockPublicPolicy     | false | bucket policy-এ public access block করা হবে না। public policy allow করা হবে।                          |
| RestrictPublicBuckets | false | শুধু public bucket-এর জন্য access restrict করা হবে না।                                                |
তুমি যদি policy বা ACL দিয়ে public দেন → access allowed হবে। ✅

### 🧩 Public read/download policy add
```bash
aws s3api put-bucket-policy \
  --bucket <your-bucket> \
  --policy '{
    "Version": "2012-10-17",
    "Statement": [
      {
        "Sid": "PublicReadGetObject",
        "Effect": "Allow",
        "Principal": "*",
        "Action": "s3:GetObject",
        "Resource": "arn:aws:s3:::<your-kucket>/*"
      }
    ]
  }'
```

| ধাপ | অংশ                                          | ব্যাখ্যা (বাংলা)                                                                                                                   |
| --- | -------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------- |
| 1   | `aws s3api put-bucket-policy`                | এই কমান্ডটি ব্যবহার করে আপনি S3 bucket-এর জন্য **policy সেট বা আপডেট** করতে পারবেন।                                                |
| 2   | `--bucket <your-bucket>`                     | এখানে `<your-bucket>` এর জায়গায় আপনার bucket-এর নাম বসাতে হবে। অর্থাৎ কোন bucket-এর জন্য policy প্রয়োগ হবে।                       |
| 3   | `--policy '{ ... }'`                         | এখানে policy JSON ফরম্যাটে লেখা হয়। এটি নির্দেশ করে কে কি কাজ করতে পারবে।                                                          |
| 4   | `"Version": "2012-10-17"`                    | Policy-এর **version**। সবসময় `"2012-10-17"` ব্যবহার করা হয়, এটি AWS-এর policy language version।                                    |
| 5   | `"Statement": [ ... ]`                       | এখানে policy-এর **statement** লেখা হয়, অর্থাৎ কোন action কে করতে পারবে তা। একাধিক statement থাকতে পারে।                            |
| 6   | `"Sid": "PublicReadGetObject"`               | Statement-এর একটি **ID**। এটা optional, তবে readable নাম দিলে সুবিধা হয়।                                                           |
| 7   | `"Effect": "Allow"`                          | Action **allow বা deny** করা হবে তা নির্দেশ করে। এখানে "Allow" মানে অনুমোদন।                                                       |
| 8   | `"Principal": "*"`                           | কে এই action করতে পারবে তা নির্ধারণ করে। `"*"` মানে সবাই (public)।                                                                 |
| 9   | `"Action": "s3:GetObject"`                   | কোন action অনুমোদিত হবে। এখানে `GetObject` মানে bucket থেকে **object read/download** করা যাবে।                                     |
| 10  | `"Resource": "arn:aws:s3:::<your-bucket>/*"` | কোন resource-এ policy প্রযোজ্য হবে। এখানে `/*` মানে **bucket-এর সব object**। `<your-bucket>` এর জায়গায় আপনার bucket নাম বসাতে হবে। |

### ✅ Test upload
```bash
aws s3 cp test.jpg s3://<bucket-name>/
https://<bucket-name>.s3.ap-south-1.amazonaws.com/test.jpg

# All Files and Folders Upload
aws s3 cp ./ s3://<bucket-name>/ --recursive

# Show all files and folders
aws s3 ls s3://electrifying-australia/
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
