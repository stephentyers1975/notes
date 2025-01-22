# labels and selectors - used to group and aggregate objects
```
apiVersion: v1
kind: Pod
metadata:
  name: nginx
  labels:
    app: nginx
    tier: frontend
spec:
  containers:
    - name: nginx
      image: nginx
```

## select pod based on label value
`kubectl get pods --selector app=App1`
`kubectl get pod --selector env=prod,bu=finance,tier=frontend`
`kubectl get pod --selector --no-headers env=prod,bu=finance,tier=frontend`

## example matching pod to deployment/replica set - use multiple labels to closer matching
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

# Annotations
```
apiVersion: apps/v1
kind: ReplicaSet
metadata:
  name: simple-webapp
  labels:
    app: App1
    function: front-end
  annotations:
    buildversion: 1.34
spec:
  replicas: 3
  selector: 
    matchLabels:
        app: App1
  template:
    metadata:
      labels:
        app: App1
        function: front-end
    spec:
      containers:
        - name: simple-webapp
          image: simple-webapp
```