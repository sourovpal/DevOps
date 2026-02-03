# Cluster Autoscaler (Nodes)

Cluster Autoscaler (CA) হলো Kubernetes-এর একটি **smart autoscaler**।
1. **Scale-up:** Pending Pod detect করে নতুন Node যোগ করে।
2. **Scale-down:** খালি বা অপ্রয়োজনীয় Node remove করে resource optimize করে।
3. **Safe & efficient:** Critical pods safe রাখে, cluster cost এবং performance optimize করে।


```bash
kubectl get pods -n kube-system

```
