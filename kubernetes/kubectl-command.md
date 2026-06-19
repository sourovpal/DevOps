## ⚙️ kubectl Command List (Cheat Sheet)

### 📌 Config & Cluster

* kubectl config view
* kubectl config get-contexts
* kubectl config current-context
* kubectl config use-context <name>
* kubectl cluster-info
* kubectl version
* kubectl get nodes

### 📦 Get Resources

* kubectl get pods
* kubectl get deployments
* kubectl get services
* kubectl get all

### 🔍 Describe

* kubectl describe pod <pod-name>
* kubectl describe deployment <name>
* kubectl describe service <name>

### 🚀 Apply / Create / Delete

* kubectl apply -f deployment.yaml
* kubectl create -f deployment.yaml
* kubectl delete -f deployment.yaml
* kubectl delete pod <pod-name>

### 🧪 Logs & Exec

* kubectl logs <pod-name>
* kubectl logs -f <pod-name>
* kubectl exec -it <pod-name> -- sh
* kubectl exec -it <pod-name> -- bash

### 🔄 Rollout

* kubectl rollout status deployment <name>
* kubectl rollout restart deployment <name>
* kubectl rollout undo deployment <name>

### 📊 Scale

* kubectl scale deployment <name> --replicas=3

### 🌐 Service

* kubectl expose deployment <name> --type=NodePort --port=3000

### 📄 YAML / Inspect

* kubectl get pod <name> -o yaml
* kubectl get deployment <name> -o yaml
* kubectl explain deployment

### 📈 Debug / Metrics

* kubectl top pod
* kubectl top node
* kubectl api-resources

### 🧹 Cleanup

* kubectl delete pod --all
* kubectl delete deployment --all



## 🐳 Minikube Commands Cheat Sheet

### 🚀 Cluster Control

* minikube start
* minikube start -p <profile>
* minikube stop
* minikube delete
* minikube delete -p <profile>
* minikube status
* minikube pause
* minikube unpause
* minikube restart

### ⚙️ Cluster Info

* minikube version
* minikube ip
* minikube logs
* minikube update-check
* minikube config view

### 📦 Kubernetes Access

* minikube kubectl -- get pods
* minikube kubectl -- get nodes
* minikube kubectl -- get all

### 🐳 Docker Environment

* minikube docker-env
* eval $(minikube docker-env)
* eval $(minikube docker-env -p <profile>)
* eval $(minikube docker-env -u)

### 🌐 Service Access

* minikube service <service-name>
* minikube service <service-name> --url

### 🔌 Addons

* minikube addons list
* minikube addons enable <addon-name>
* minikube addons disable <addon-name>

### 💻 SSH / Node Access

* minikube ssh

### 📊 Dashboard

* minikube dashboard

### 📸 Images

* minikube image load <image-name>
* minikube image ls

### 🧪 Troubleshooting

* minikube logs
* minikube status
* minikube profile list

### ⚡ Useful Shortcuts

* minikube start
* minikube stop
* minikube delete
* minikube dashboard
* minikube service <name>


