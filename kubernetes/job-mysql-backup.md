# 💡Mysql Database backup

### Dockerfile
`Dockerfile`
```yaml  
FROM alpine:latest

RUN apk add --no-cache \
    mysql-client \
    bash \
    python3 \
    py3-pip \
    && pip3 install awscli --break-system-packages

COPY script.sh /script.sh

RUN chmod +x /script.sh

CMD ["/script.sh"]
```
### ✅ script.sh
`script.sh`
```sh
#!/bin/bash

set -e

# ==========================
# Configuration (Environment Variables)
# ==========================
DB_HOST="${DB_HOST}"
DB_PORT="${DB_PORT:-3306}"
DB_NAME="${DB_NAME}"
DB_USER="${DB_USER}"
DB_PASS="${DB_PASS}"

BACKUP_DIR="${BACKUP_DIR:-/backup}"

DATE=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="${DB_NAME}_${DATE}.sql"

S3_BUCKET="${S3_BUCKET}"
S3_PATH="${S3_PATH:-mysql-backups}"
MYSQL_SSL="${MYSQL_SSL:-DISABLED}"

export AWS_ACCESS_KEY_ID="${AWS_ACCESS_KEY_ID}"
export AWS_SECRET_ACCESS_KEY="${AWS_SECRET_ACCESS_KEY}"
export AWS_DEFAULT_REGION="${AWS_DEFAULT_REGION:-ap-southeast-1}"

# ==========================
# Validate Required Variables
# ==========================
required_vars=(
  DB_HOST
  DB_NAME
  DB_USER
  DB_PASS
  S3_BUCKET
  AWS_ACCESS_KEY_ID
  AWS_SECRET_ACCESS_KEY
)

for var in "${required_vars[@]}"; do
    if [ -z "${!var}" ]; then
        echo "Error: Environment variable '$var' is not set."
        exit 1
    fi
done

# ==========================
# Create Backup Directory
# ==========================
mkdir -p "$BACKUP_DIR"

echo "Starting MySQL dump..."

mysqldump \
    -h "$DB_HOST" \
    -P "$DB_PORT" \
    -u "$DB_USER" \
    -p"$DB_PASS" \
    --skip-ssl \
    --default-auth=mysql_native_password \
    --single-transaction \
    --routines \
    --triggers \
    "$DB_NAME" > "$BACKUP_DIR/$BACKUP_FILE"

echo "Database dump completed."

echo "Uploading backup to S3..."

aws s3 cp \
    "$BACKUP_DIR/$BACKUP_FILE" \
    "s3://$S3_BUCKET/$S3_PATH/$BACKUP_FILE"

echo "Upload completed."

rm -f "$BACKUP_DIR/$BACKUP_FILE"

echo "Local backup deleted."

echo "Backup process finished successfully."
```

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
              image: docker.io/sourovpal/mysql-db-backup:latest
              imagePullPolicy: Never

              resources:
                requests:
                  cpu: 100m
                  memory: 128Mi
                limits:
                  cpu: 500m
                  memory: 512Mi

              env:
                - name: MYSQL_SSL
                  value: DISABLED

                - name: DB_HOST
                  value: db

                - name: DB_PORT
                  value: "3306"

                - name: DB_NAME
                  value: db_name # Database name

                - name: DB_USER
                  value: root

                - name: DB_PASS
                  valueFrom:
                    secretKeyRef:
                      name: mysql-secret
                      key: MYSQL_ROOT_PASSWORD

                - name: BACKUP_DIR
                  value: /

                - name: S3_BUCKET
                  value: electrifying-australia

                - name: S3_PATH
                  value: database-backups

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

