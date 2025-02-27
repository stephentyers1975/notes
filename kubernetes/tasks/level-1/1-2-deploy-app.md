# Deploy Applications with Kubernetes Deployments

Create a deployment named nginx to deploy the application nginx using the image nginx:latest (ensure to specify the tag)

Note: The kubectl utility on jump_host is set up to interact with the Kubernetes cluster.

## imperative
`kubectl create deployment nginx --image nginx:latest `
## Declarative
```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx
  labels:
    name: nginx
spec:
  replicas: 1
  selector:
    matchLabels:
      name: nginx-pod
  template:
    metadata:
      name: nginx-pod
      labels:
        name: nginx-pod
    spec:
      containers:
        - name: nginx-container
          image: nginx:latest
```