# Deploy Highly Available Pods with Replication Controller
Create a ReplicationController using the nginx image, preferably with latest tag, and name it nginx-replicationcontroller.

Assign labels app as nginx_app, and type as front-end. Ensure the container is named nginx-container and set the replica count to 3.

```
apiVersion: v1
kind: ReplicationController
metadata:
  name: nginx-replicationcontroller
  labels:
    app: nginx_app
    type: front-end
spec:
  replicas: 3
  selector:
    app: nginx_app
    type: front-end
  template:
    metadata:
      name: nginx-pod
      labels:
        app: nginx_app
        type: front-end
    spec:
      containers:
      - name: nginx-container
        image: nginx:latest
        ports:
        - containerPort: 80
```