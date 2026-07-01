# 💡Mysql Database backup

### ✅ Cron Job

`job-mysql-backup-s3.yaml`

```yaml
apiVersion: batch/v1
kind: CronJob
metadata:
  name: mysql-backup
  namespace: web-app

spec:
  schedule: "0 0 * * *"
  concurrencyPolicy: Forbid

  successfulJobsHistoryLimit: 3
  failedJobsHistoryLimit: 3

  jobTemplate:
    spec:
      backoffLimit: 2

      template:
        spec:
          restartPolicy: Never

          containers:
            - name: mysql-backup
              image: databack/mysql-backup:latest
              imagePullPolicy: IfNotPresent

              resources:
                requests:
                  cpu: 100m
                  memory: 128Mi
                limits:
                  cpu: 500m
                  memory: 512Mi

              env:
                - name: TZ
                  value: UTC

                - name: MYSQL_HOST
                  value: db

                - name: MYSQL_PORT
                  value: "3306"

                - name: MYSQL_DATABASE
                  value: database_name__

                - name: MYSQL_USER
                  value: root

                - name: MYSQL_PASSWORD
                  valueFrom:
                    secretKeyRef:
                      name: mysql-secret
                      key: MYSQL_ROOT_PASSWORD

                - name: AWS_ACCESS_KEY_ID
                  valueFrom:
                    secretKeyRef:
                      name: s3-credentials
                      key: AWS_ACCESS_KEY_ID

                - name: AWS_SECRET_ACCESS_KEY
                  valueFrom:
                    secretKeyRef:
                      name: s3-credentials
                      key: AWS_SECRET_ACCESS_KEY

                - name: AWS_DEFAULT_REGION
                  value: ap-southeast-1

                - name: S3_BUCKET
                  value: s3-database-name

                - name: S3_PREFIX
                  value: database-backups # folder name

                - name: KEEP_LAST
                  value: "30"

```

### ✅ Mysql Secret

`mysql-secret.yaml`

```yaml 
apiVersion: v1
kind: Secret
metadata:
  name: mysql-secret
  namespace: web-app
type: Opaque
stringData:
  MYSQL_ROOT_PASSWORD: 123456
  MYSQL_DATABASE: database_name__
  MYSQL_USER: root_username
  MYSQL_PASSWORD: 12345678
```

### ✅ S3 Secret

`s3-secret.yaml`

```yaml 
apiVersion: v1
kind: Secret
metadata:
  name: s3-credentials
  namespace: web-app
type: Opaque
stringData:
  AWS_ACCESS_KEY_ID: YOUR_AWS_ACCESS_KEY_ID
  AWS_SECRET_ACCESS_KEY: YOUR_AWS_SECRET_ACCESS_KEY
```

