# Deploy Node App on Kubernetes
The Nautilus development team has completed development of one of the node applications, which they are planning to deploy on a Kubernetes cluster. They recently had a meeting with the DevOps team to share their requirements. Based on that, the DevOps team has listed out the exact requirements to deploy the app. Find below more details:

Create a deployment using gcr.io/kodekloud/centos-ssh-enabled:node image, replica count must be 2.

Create a service to expose this app, the service type must be NodePort, targetPort must be 8080 and nodePort should be 30012.

Make sure all the pods are in Running state after the deployment.

You can check the application by clicking on NodeApp button on top bar

## create and deploy template for deployment and service
```
apiVersion: apps/v1
kind: Deployment
metadata:
  labels:
    app: node-app
  name: node-deployment
spec:
  replicas: 2
  selector:
    matchLabels:
      app: node-app
  template:
    metadata:
      labels:
        app: node-app
    spec:
      containers:
      - image: gcr.io/kodekloud/centos-ssh-enabled:node
        name: node-container
        ports:
        - containerPort: 8080
---
apiVersion: v1
kind: Service
metadata:
  name: node-service
  labels:
    app: node-app
spec:
  type: NodePort
  ports:
  - nodePort: 30012
    port: 8080
    protocol: TCP
    targetPort: 8080
  selector:
    app: node-app
```