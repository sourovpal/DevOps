# **Create Pod Configration**

pod.yaml

### 🧩 Step 1: Basic Configration

```bash 
  apiVersion: v1
  kind: Pod
  metadata:
    name: html-website-pod
    labels:
      app: html-website
```

### 🧩 Step 2: Container Setup

```bash 
  spec:
    containers:
    - name: html-website                    # Container Name
      image: html-website:latest            # Docker Image Name
      imagePullPolicy: IfNotPresent         # Never, IfNotPresent, Always
      ports:
      - containerPort: 80
```
📌 Always - Pod start হলেই Docker Hub / Registry থেকে image pull করবে\
📌 IfNotPresent - আগে local image আছে কিনা চেক করবে | থাকলে 👉 local ব্যবহার করবে | না থাকলে 👉 registry থেকে pull করবে\
📌 Never - শুধু local Docker image ব্যবহার করবে

### 🧩 Step 3: Manage Resources
```bash 
    resources:
      requests:
        cpu: "250m"
        memory: "256Mi"
      limits:
        cpu: "500m"
        memory: "512Mi"
```

### 🧩 Delete Pod

```bash
  👉 kubectl delete pod/html-website-deployment-xxxxxxxxx                # Delete Pod
```

### 🧩 Others Commands

```bash
  👉 kubectl get pods                                                    # Show all Pods
  👉 kubectl describe pod/html-website-deployment-xxxxxxxxx              # Show existing pod configration details
```
