# Kubernetes Secret ENV Variable Set

`configmap.yaml`

### 🧩 Step 1: Basic Configration
```bash
  apiVersion: v1
  kind: Secret
  metadata:
    name: app-secret
  type: Opaque
  data:
    APP_NAME: TXlTZWNyZXRBcHA=       # base64 encoded "MySecretApp"
    APP_ENV: cHJvZHVjdGlvbg==       # base64 encoded "production"
    DB_PASSWORD: c2VjdXJlUGFzcw==  # base64 encoded "securePass"
```
