# Cluster Autoscaler (Nodes)

Cluster Autoscaler (CA) হলো Kubernetes-এর একটি **smart autoscaler**।
1. **Scale-up:** Pending Pod detect করে নতুন Node যোগ করে।
2. **Scale-down:** খালি বা অপ্রয়োজনীয় Node remove করে resource optimize করে।
3. **Safe & efficient:** Critical pods safe রাখে, cluster cost এবং performance optimize করে।

### Show all Kube System pods
```bash
kubectl get pods -n kube-system
```
### Deploy

```bash
kubectl apply -f https://github.com/kubernetes/autoscaler/releases/download/cluster-autoscaler-1.28.4/cluster-autoscaler-autodiscover.yaml
```
### Edit Deployment File
```bash
kubectl edit deployment cluster-autoscaler -n kube-system
# Add Cluster Name
 - command:
    - --cluster-name=<YOUR CLUSTER NAME>

# Rollout Restart Old Pods
kubectl rollout restart deployment/cluster-autoscaler -n kube-system
```

### Check Status
```bash
kubectl get pods -n kube-system
# IF Any Problem Show Logs
kubectl logs -n kube-system deployment/cluster-autoscaler
```


