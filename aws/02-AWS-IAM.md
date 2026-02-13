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
