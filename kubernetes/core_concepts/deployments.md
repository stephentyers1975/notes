# Deployments - recreate/rolling

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: myapp-deployment
  labels:
    app: myapp
    type: front-end
spec:
  template:
    metadata:
      name: myapp-pod
      labels:
        app: myapp
        type: front-end
    spec:
      containers:
      - name: nginx-container
        image: nginx
  replicas: 3
  selector: 
    matchLabels:
        type: front-end
```
## YAML generated with kubectl dry run
```
apiVersion: apps/v1
kind: Deployment
metadata:
  creationTimestamp: null
  labels:
    app: httpd-frontend
  name: httpd-frontend
spec:
  replicas: 3
  selector:
    matchLabels:
      app: httpd-frontend
  strategy: {}
  template:
    metadata:
      creationTimestamp: null
      labels:
        app: httpd-frontend
    spec:
      containers:
      - image: httpd:2.4-alpine
        name: httpd
        resources: {}
status: {}
```
## display deployments
`kubectl get deployments`
## display all created objects
`kubectl get all`
## display detailed information of deployment
`kubectl describe deployment deployment_name`
## create deployment from definition file
`kubectl create -f deployment-definition.yaml`
## create deployment from definition file and record cause of change
`kubectl create -f deployment-definition.yaml --record`
## create deployment inline
`kubectl create deployment deployment_name --image=image_name --replicas=replica_num`
## Generate Deployment YAML file (-o yaml). Don’t create it(–dry-run)
`kubectl create deployment --image=nginx nginx --dry-run=client -o yaml`
## Generate Deployment YAML file (-o yaml). Don’t create it(–dry-run) and save it to a file.
`kubectl create deployment --image=nginx nginx --dry-run=client -o yaml > nginx-deployment.yaml`
## apply deployment from definition file - will create if new or change/upgrade deployment if existing
`kubectl apply -f deployment-definition.yaml`
## Manually change a deployment - does not change yaml file configuration!!!
`kubectl set image deployment/deployment_name container_spec_name=image_name`
## view status of deployment rollout
`kubectl rollout status deployment/deployment_name`
## view history of deployment rollout revisions
`kubectl rollout history deployment/deployment_name`
## rollback deployment
`kubectl rollout undo deployment/nginx-deployment`
## rollback deployment to particular revision from rollout history
`kubectl rollout undo deployment/nginx-deployment --revision=2`
## annotate a deployment
`kubectl annotate deployment nginx kubernetes.io/change-cause="version change to 1.16.0 to latest" --overwrite=true`
## rollback deployment
`kubectl undo deployment/deployment_name`
## expose port on a deployment
`kubectl expose deployment deployment_name --port 80`
## export loadbalancer on a deployment
`kubectl expose deployment deployment_name --type=LoadBalancer --port=80 --target-port=80`
## Scale a deployment 'foo' to 3
`kubectl scale --replicas=3 deployment/foo`