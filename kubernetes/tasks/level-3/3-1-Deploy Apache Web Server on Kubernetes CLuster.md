# Deploy Apache Web Server on Kubernetes CLuster
There is an application that needs to be deployed on Kubernetes cluster under Apache web server. The Nautilus application development team has asked the DevOps team to deploy it. We need to develop a template as per requirements mentioned below:

Create a namespace named as httpd-namespace-xfusion.

Create a deployment named as httpd-deployment-xfusion under newly created namespace. For the deployment use httpd image with latest tag only and remember to mention the tag i.e httpd:latest, and make sure replica counts are 2.

Create a service named as httpd-service-xfusion under same namespace to expose the deployment, nodePort should be 30004.
## create namespace
`kubectl create namespace httpd-namespace-devops`
## create deployment
`kubectl create deployment httpd-deployment-devops --namespace httpd-namespace-devops --image httpd:latest --replicas 2`
```
apiVersion: v1
kind: Namespace
metadata:
  name: httpd-namespace-xfusion
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: httpd-deployment-xfusion
  namespace: httpd-namespace-devops
spec:
  replicas: 2
  selector:
    matchLabels:
      app: httpd
  template:
    metadata:
      labels:
        app: httpd
    spec:
      containers:
      - name: httpd-container
        image: httpd:latest
        ports:
        - containerPort:
```
## create service
```
apiVersion: v1
kind: Service
metadata:
  name: httpd-service-xfusion
  namespace: httpd-namespace-devops
spec:
  type: NodePort
  selector:
    app: httpd-deployment-xfusion
  ports:
  - protocol: TCP
    port: 80
    targetPort: 80
    nodePort: 30004
```
