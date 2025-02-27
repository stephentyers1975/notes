# Deploy Replica Set in Kubernetes Cluster
Create a ReplicaSet using nginx image with latest tag (ensure to specify as nginx:latest) and name it nginx-replicaset.
Apply labels: app as nginx_app, type as front-end.
Name the container nginx-container. Ensure the replica count is 4.
## create replication set yaml file
```
apiVersion: apps/v1
kind: ReplicaSet
metadata:
  name: nginx-replicaset
  labels:
    app: nginx_app
    type: front-end
spec:
  template:
    metadata:
      labels:
        app: nginx_app
        type: front-end
    spec:
      containers:
        - name: nginx-container
          image: nginx:latest
  replicas: 4
  selector:
    matchLabels:
        app: nginx_app
```