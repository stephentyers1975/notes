# replication controller

* replication controller - older technology
* replica set - replaces above
* replica set can manage other pods that wern't created with the replica set

# replication controller yaml
```
apiVersion: app
kind: ReplicationController
metadata:
  name: myapp-rc
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
```
# replica set yaml
```
apiVersion: apps/v1
kind: ReplicaSet
metadata:
  name: myapp-replicaset
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

# Replica set/controller commands
## create replicaset from definition file
`kubectl create -f replicaset-definition.yaml`
## apply replicaset from definition file - will create if new
`kubectl apply -f replicaset-definition.yaml`
## view replication controllers(legacy for new replica-set)
`kubectl get replicationcontroller`
## view replica-set
`kubectl get replicaset`
## delete replica-set
`kubectl delete replicaset replicaset_name`
## update replica set after instance count change edit in yaml file
`kubectl replace -f replicaset-definition.yaml`
### or directly via cmd by providing file (does not update number in file as in replace option)
`kubectl scale --replicas=6 -f replicaset-definition.yaml`
### or by providing replicaset name (does not update number in file as in replace option)
`kubectl scale --replicas=6 replicaset replicaset_name`
## edit replica set
`kubectl edit replicaset replicaset_name`