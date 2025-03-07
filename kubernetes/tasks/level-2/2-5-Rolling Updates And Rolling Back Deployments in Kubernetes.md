# Rolling Updates And Rolling Back Deployments in Kubernetes
There is a production deployment planned for next week. The Nautilus DevOps team wants to test the deployment update and rollback on Dev environment first so that they can identify the risks in advance. Below you can find more details about the plan they want to execute.

Create a namespace nautilus. Create a deployment called httpd-deploy under this new namespace, It should have one container called httpd, use httpd:2.4.27 image and 4 replicas. The deployment should use RollingUpdate strategy with maxSurge=1, and maxUnavailable=2. Also create a NodePort type service named httpd-service and expose the deployment on nodePort: 30008.

Now upgrade the deployment to version httpd:2.4.43 using a rolling update.

Finally, once all pods are updated undo the recent update and roll back to the previous/original version.
## create namespace
`kubectl create ns nautilus`
## deploy yaml for deployment and service
```
---
apiVersion: apps/v1
kind: Deployment
metadata:
  labels:
    app: httpd-deploy
  name: httpd-deploy
  namespace: nautilus
spec:
  replicas: 4
  selector:
    matchLabels:
      app: httpd-deploy
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxUnavailable: 2
      maxSurge: 1
  template:
    metadata:
      labels:
        app: httpd-deploy
    spec:
      containers:
      - image: httpd:2.4.27
        name: httpd

---
apiVersion: v1
kind: Service
metadata:
  name: httpd-service
  namespace: nautilus
  labels:
    app: httpd-deploy
spec:
  type: NodePort
  ports:
  - nodePort: 30008
    port: 80
    protocol: TCP
    targetPort: 80
  selector:
    app: httpd-deploy
```
## change image on deployment
`kubectl set image deployment/httpd-deploy httpd=httpd:2.4.43 -n nautilus`
## rollback deployment
`kubectl rollout undo deployment httpd-deploy`
