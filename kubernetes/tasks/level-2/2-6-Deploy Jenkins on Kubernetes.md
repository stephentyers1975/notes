# Deploy Jenkins on Kubernetes
The Nautilus DevOps team is planning to set up a Jenkins CI server to create/manage some deployment pipelines for some of the projects. They want to set up the Jenkins server on Kubernetes cluster. Below you can find more details about the task:

1) Create a namespace jenkins

2) Create a Service for jenkins deployment. Service name should be jenkins-service under jenkins namespace, type should be NodePort, nodePort should be 30008

3) Create a Jenkins Deployment under jenkins namespace, It should be name as jenkins-deployment , labels app should be jenkins , container name should be jenkins-container , use jenkins/jenkins image , containerPort should be 8080 and replicas count should be 1.

Make sure to wait for the pods to be in running state and make sure you are able to access the Jenkins login screen in the browser before hitting the Check button.

## create namespace
`kubectl create ns jenkins`
## create template for deployment and service
```
---
apiVersion: apps/v1
kind: Deployment
metadata:
  labels:
    app: jenkins
  name: jenkins-deployment
  namespace: jenkins
spec:
  replicas: 1
  selector:
    matchLabels:
      app: jenkins
  template:
    metadata:
      labels:
        app: jenkins
    spec:
      containers:
      - image: jenkins/jenkins
        name: jenkins-container
        ports:
        - containerPort: 8080
---
apiVersion: v1
kind: Service
metadata:
  name: jenkins-service
  namespace: jenkins
  labels:
    app: jenkins
spec:
  type: NodePort
  ports:
  - nodePort: 30008
    port: 8080
    protocol: TCP
    targetPort: 8080
  selector:
    app: jenkins
```