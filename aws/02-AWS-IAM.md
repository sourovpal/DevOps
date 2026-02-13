# AWS Identity and Access Management

### Create User

```bash
aws iam create-user --user-name soruov
# Outout
{
    "User": {
        "Path": "/",
        "UserName": "soruov",
        "UserId": "AIDAEXAMPLE123",
        "Arn": "arn:aws:iam::123456789012:user/soruov",
        "CreateDate": "2026-02-13T12:00:00Z"
    }
}
```

### Create User With Passwrod
```bash
aws iam create-login-profile --user-name soruov --password "MyStrongPassw0rd!" --password-reset-required
```

### User API/CLI Access Create
```bash
aws iam create-access-key --user-name soruov

# Output
{
    "AccessKey": {
        "UserName": "soruov",
        "AccessKeyId": "AKIAEXAMPLEKEY",
        "Status": "Active",
        "SecretAccessKey": "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY",
        "CreateDate": "2026-02-13T12:05:00Z"
    }
}
```

### ইউজারকে গ্রুপ বা পলিসি যোগ করা
```bash
aws iam attach-user-policy --user-name USERNAME --policy-arn arn:aws:iam::aws:policy/AdministratorAccess
```

### ইউজারকে Role “Assume” করার অনুমতি দেওয়া
`Trust policy trust-policy.json`
```bash
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": { "AWS": "arn:aws:iam::123456789012:user/soruov" },
      "Action": "sts:AssumeRole"
    }
  ]
}
```

### Create Role Attach Policy
```bash
aws iam create-role --role-name MyAdminRole --assume-role-policy-document file://trust-policy.json

aws iam attach-role-policy --role-name MyAdminRole --policy-arn arn:aws:iam::aws:policy/AdministratorAccess

```

## ১️⃣ **Policy কী?**

**Policy** হলো একটি JSON ডকুমেন্ট যা বলে **কে কি করতে পারবে**।

* উদাহরণ: একটি পলিসি বলতে পারে, "এই ইউজার S3 bucket পড়তে পারবে কিন্তু মুছতে পারবে না।"
* Policy-তে থাকে:

  1. **Action** – কি কাজ করতে পারবে (যেমন: `s3:GetObject`, `ec2:StartInstances`)
  2. **Resource** – কোন সার্ভিস বা রিসোর্সে কাজ করবে (যেমন: কোন S3 bucket বা EC2 instance)
  3. **Effect** – `Allow` বা `Deny`

**উদাহরণ (S3 read-only পলিসি):**

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::my-bucket/*"
    }
  ]
}
```

> অর্থাৎ এই পলিসি যেটার সাথে attach করা হবে, সে শুধু `my-bucket`-এর ফাইল পড়তে পারবে, মুছতে পারবে না।

---

## ২️⃣ **Role কী?**

**Role** হলো একটি “অস্থায়ী পরিচয়” (temporary identity) যা **কোনো AWS সার্ভিস বা ইউজারকে পাওয়ার দেয় নির্দিষ্ট কাজ করার জন্য।**

* Role-এ নিজস্ব **Policy থাকতে পারে**।
* ইউজার বা সার্ভিস **AssumeRole** করলে সেই Role-এর পারমিশন পায়।

**Role-র প্রধান ব্যবহার:**

| ব্যবহার                           | উদাহরণ                                             |
| --------------------------------- | -------------------------------------------------- |
| সার্ভিসে পলিসি দিতে               | EC2 instance-কে S3 access দেওয়া                   |
| ইউজারের জন্য temporary permission | একজন ডেভেলপারকে short-term admin permission দেওয়া |
| Cross-account access              | অন্য AWS account-এর resources access দেওয়া        |

**উদাহরণ:**

* EC2 instance-এ Role attach করলে, সেই EC2 S3 bucket পড়তে পারবে।
* ইউজার CLI থেকে `assume-role` করলে, সে ওই Role-এর temporary credentials পাবে।


## ৩️⃣ **Policy vs Role পার্থক্য**

| বিষয়                | Policy                                     | Role                                                  |
| ------------------- | ------------------------------------------ | ----------------------------------------------------- |
| কি?                 | একটি নিয়মের সেট – কী করা যাবে/করা যাবে না | একটি “identity” যা পারমিশন পায় Policy-এর মাধ্যমে     |
| কার সাথে attach হয়? | User, Group, Role                          | User, Service (EC2, Lambda) বা অন্য Role (AssumeRole) |
| ব্যবহার             | কে কি করতে পারবে নির্ধারণ                  | কে/কোনো সার্ভিস কোন permission নিয়ে কাজ করবে তা দেয়   |
| Temporary?          | না, স্থায়ী                                | হ্যাঁ, বিশেষ করে যখন ইউজার assume করে                 |

💡 সহজভাবে বলতে গেলে:

* **Policy = নিয়ম**
* **Role = সেই নিয়ম নিয়ে কাজ করার জন্য identity**



