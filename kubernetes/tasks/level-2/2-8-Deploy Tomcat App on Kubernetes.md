# Deploy Tomcat App on Kubernetes
A new java-based application is ready to be deployed on a Kubernetes cluster. The development team had a meeting with the DevOps team to share the requirements and application scope. The team is ready to setup an application stack for it under their existing cluster. Below you can find the details for this:

Create a namespace named tomcat-namespace-datacenter.

Create a deployment for tomcat app which should be named as tomcat-deployment-datacenter under the same namespace you created. Replica count should be 1, the container should be named as tomcat-container-datacenter, its image should be gcr.io/kodekloud/centos-ssh-enabled:tomcat and its container port should be 8080.

Create a service for tomcat app which should be named as tomcat-service-datacenter under the same namespace you created. Service type should be NodePort and nodePort should be 32227.

## create namespace
`kubectl create ns tomcat-namespace-datacenter`

## create and deploy template for deployment and service
```
apiVersion: apps/v1
kind: Deployment
metadata:
  labels:
    app: grafana
  name: tomcat-deployment-datacenter
  namespace: tomcat-namespace-datacenter
spec:
  replicas: 1
  selector:
    matchLabels:
      app: tomcat-app
  template:
    metadata:
      labels:
        app: tomcat-app
    spec:
      containers:
      - image: gcr.io/kodekloud/centos-ssh-enabled:tomcat
        name: tomcat-container-datacenter
        ports:
        - containerPort: 8080
---
apiVersion: v1
kind: Service
metadata:
  name: tomcat-service-datacenter
  labels:
    app: tomcat-app
  namespace: tomcat-namespace-datacenter
spec:
  type: NodePort
  ports:
  - nodePort: 32227
    port: 8080
    protocol: TCP
    targetPort: 8080
  selector:
    app: tomcat-app
```