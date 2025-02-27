# Deploy Pods in Kubernetes Cluster

## generate yaml
`kubectl run pod-nginx --image nginx:latest --dry-run=client -o yaml > pod.yaml`
## edit yaml as below for additional details
```
apiVersion: v1
kind: Pod
metadata:
  name: pod-nginx
  labels:
    app: nginx_app
spec:
  containers:
  - name: nginx-container
    image: nginx:latest

```