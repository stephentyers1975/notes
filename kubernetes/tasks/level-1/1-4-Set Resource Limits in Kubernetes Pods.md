# Set Resource Limits in Kubernetes Pods

Create a pod named httpd-pod with a container named httpd-container. Use the httpd image with the latest tag (specify as httpd:latest). Set the following resource limits:
Requests: Memory: 15Mi, CPU: 100m
Limits: Memory: 20Mi, CPU: 100m


`kubectl create -f httpd-pod.yaml`
```
apiVersion: v1
kind: Pod
metadata:
  labels:
    run: httpd-pod
  name: httpd-pod
spec:
  containers:
  - image: httpd:latest
    name: httpd-container
    resources:
      requests:
        memory: "15Mi"
        cpu: "100m"
      limits:
        memory: "20Mi"
        cpu: "100m"
```