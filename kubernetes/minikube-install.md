# Minikube & KubeCTL install and setup


### 🧩 Step 1: kubectl Install

```bash 
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

chmod +x kubectl
sudo mv kubectl /usr/local/bin/

kubectl version --client
```

### 🧩 Step 2: Minikube Install

```bash
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64

sudo install minikube-linux-amd64 /usr/local/bin/minikube
minikube version

minikube start --driver=docker
minikube ip
```
### 🧩 Step 3: Docker ENV for Minikube

```bash
eval $(minikube docker-env)
```

### 🧩 Step 4: Minikube Docker ENV to Docker ENV
```bash
eval $(minikube docker-env -u)
```
