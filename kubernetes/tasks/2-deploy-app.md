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