# Helm Install and Use

### 🧩 Install
```bash
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

# Check Version

helm version
```

### 🧩 Helm Chart structure

```
myapp-helm/
├── Chart.yaml
├── values.yaml
├── templates/
│   ├── frontend-deployment.yaml
│   ├── frontend-service.yaml
│   ├── backend-deployment.yaml
│   ├── backend-service.yaml
```

* **Chart.yaml** – Chart মেটাডেটা
* **values.yaml** – Frontend & Backend কনফিগারেশন
* **templates/** – Deployment + Service YAML টেমপ্লেট

### 🧩 Chart.yaml

```yaml
apiVersion: v2
name: myapp
description: My Fullstack App
version: 1.0.0
```

### 🧩 values.yaml

```yaml
frontend:
  name: frontend
  image: my-frontend:1.0.0
  replicas: 2
  port: 80

backend:
  name: backend
  image: my-backend:1.0.0
  replicas: 2
  port: 8080
```

### 🧩 frontend-deployment.yaml

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: {{ .Values.frontend.name }}
spec:
  replicas: {{ .Values.frontend.replicas }}
  selector:
    matchLabels:
      app: {{ .Values.frontend.name }}
  template:
    metadata:
      labels:
        app: {{ .Values.frontend.name }}
    spec:
      containers:
        - name: {{ .Values.frontend.name }}
          image: {{ .Values.frontend.image }}
          ports:
            - containerPort: {{ .Values.frontend.port }}
```

### 🧩 frontend-service.yaml

```yaml
apiVersion: v1
kind: Service
metadata:
  name: {{ .Values.frontend.name }}
spec:
  type: LoadBalancer
  selector:
    app: {{ .Values.frontend.name }}
  ports:
    - port: {{ .Values.frontend.port }}
      targetPort: {{ .Values.frontend.port }}
```
### 🧩 backend-deployment.yaml

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: {{ .Values.backend.name }}
spec:
  replicas: {{ .Values.backend.replicas }}
  selector:
    matchLabels:
      app: {{ .Values.backend.name }}
  template:
    metadata:
      labels:
        app: {{ .Values.backend.name }}
    spec:
      containers:
        - name: {{ .Values.backend.name }}
          image: {{ .Values.backend.image }}
          ports:
            - containerPort: {{ .Values.backend.port }}
```
### 🧩 backend-service.yaml

```yaml
apiVersion: v1
kind: Service
metadata:
  name: {{ .Values.backend.name }}
spec:
  type: ClusterIP
  selector:
    app: {{ .Values.backend.name }}
  ports:
    - port: {{ .Values.backend.port }}
      targetPort: {{ .Values.backend.port }}
```
### 🧩 Helm install workflow

```bash
helm install myapp ./myapp-helm
```
