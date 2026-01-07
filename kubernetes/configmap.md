# **ConfigMap ENV Veriable Set**

`configmap.yaml`

### 🧩 Step 1: Basic Configration
```bash
  apiVersion: v1
  kind: ConfigMap                           # Type
  metadata:
    name: html-website-configmap            # Unique Name
  data:
    APP_NAME: "My Laravel App"
    APP_ENV: "production"
    DB_HOST: "mysql-service"
```
### 🧩 Step 2: Use All Veriable In Pod's or Deployment
```bash
spec:
  containers:
    - name: demo-container
      image: nginx
      envFrom:
        - configMapRef:
            name: html-website-configmap           # Must Match metadata.name (Step: 1)
```
### 🧩 ConfigMap change করলে ENV auto update হয়? ❌ না
```bash
  # ENV variables container start এর সময় set হয়
  # ConfigMap update করলে running Pod এর ENV বদলায় না

  # ✔️ Solution:

  👉 kubectl rollout restart deployment <deployment-name>

```
