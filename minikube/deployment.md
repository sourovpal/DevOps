# **Write Deployment file**

### 🧩 Step 1: Basic Configration

```bash
apiVersion: apps/v1
  kind: Deployment                            # Must use this name
  metadata:
    name: html-website-deployment             # Deployment Name Must be unique
```

### 🧩 Step 2: Replicas & Selector Match Labels Configration

```bash
spec:
  replicas: 3                                 # number of pods initial stage
  selector:
    matchLabels:
      app: html-website 
```


### 🧩 Step 3: Pod Configration

```bash
 template:
    metadata:
      labels:
        app: html-website                   # Must matchLabels.app: (html-website - step 2)
    spec:
      containers:
        - name: html-website                # Container Name
          image: html-website:latest        # Docker Image Name with tag
          imagePullPolicy: Never            # Never, IfNotPresent, Always
          ports:
            - containerPort: 80
```
