# Kubernetes Components

!["Kubernetes components"](/images/kub-compnents.png)

* Master node has kube-apiserver component running
* Master node has etcd key/value store, controller manager and scheduler service
* Worker node has kubelet agent component running responsible for report health of worker node and carry out actions of master node.
* Worker node has container runtime running.

!["Master vs Worker node"](/images/masterworker.png)

# Kubectl commands

## get cluster information
`kubectl cluster-info`
## get nodes
`kubectl get nodes`
## get nodes - extended information
`kubectl get pods -o wide`
## get nodes - All namespaces
`kubectl get pods -A`
## create pod
`kubectl run pod_name --image=container_image_name`
## create pod in dry run mode and output the genrated yaml
`kubectl run pod_name --image=container_image_name --dry-run=client -o yaml`
## list pods
`kubectl get pods`
## get detailed pod information
`kubectl descibe pod pod_name`
## edit pod configuration yaml
`kubectl edit pod pod_name`

# YAML in Kubernetes

| Kind | Version | 
|:-------------|:--------------:
| POD       |     V1    |        
| Service      |     V1    |         
| Replica Set      |     apps/V1     |         
| Deployment      |     apps/V1     |         

## example pod definiton YAML file
```
apiVersion: v1
kind: Pod
metadata:
  name: myapp-pod
  labels:
    app: myapp
    type: front-end
spec:
  containers:
    - name: nginx-container
      image: nginx
```
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

## create pod from definition file
`kubectl create -f pod-definition.yaml`
## apply pod from definition file - will create if new
`kubectl apply -f pod-definition.yaml`
## create pod with wildcard
`kubectl create -f .`
## apply pod with wildcard
`kubectl apply -f .`

# Replica set
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
### or directly via cmd by providing file (does not update number in file as in first option)
`kubectl scale --replicas=6 -f replicaset-definition.yaml`
### or by providing replicaset name (does not update number in file as in first option)
`kubectl scale --replicas=6 -f replicaset replicaset_name`
## edit replica set
`kubectl edit replicaset replicaset_name`

# Deployments - recreat/rolling

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
## apply deployment from definition file - will create if new or change/upgrade deployment if existing
`kubectl apply -f deployment-definition.yaml`
## Manually change a deployment - does not change yaml file configuration!!!
`kubectl set image deployment/deployment_name container_spec_name=image_name`
## view status of deployment rollout
`kubectl rollout status deployment/deployment_name`
## view history of deployment rollout revisions
`kubectl rollout history deployment/deployment_name`
## rollback deployment
`kubectl undo deployment/deployment_name`

# Services
* NodePort -> listens to port on the cluster node and forwards requests to pods
* ClusterIP -> creates VIP inside cluster to enable connectivity between different services i.e. frontend to backend
* LoadBalancer -> Provisions loadbalancer in supported cloud providers

## NodePort

!["nodeport](/images/nodeport.png)

* port -> port number on service
* ip -> ip address on service
* TargetPort port number on pod
* NodePort - > port number on cluster node

### definition file

!["nodeport](/images/nodeport2.png)

## create service from definition file
`kubectl create -f service-definition.yaml`
## display services
`kubectl get services`
## view url on minikube
`minikube service service_name --url`

```
---
apiVersion: v1
kind: Service
metadata:
  name: webapp-service
  namespace: default
spec:
  type: NodePort
  ports:
  - nodePort: 30080
    port: 8080
    targetPort: 8080
  selector:
    name: simple-webapp
```


## ClusterIP
### definition example file
```
apiVersion: v1
kind: Service
metadata:
  name: back-end
spec:
  type: ClusterIP
  ports:
    - targetPort: 80
      port: 80

  selector:
    app: myapp
    type: back-end
```

# Load Balancer -> integrates with majore cloud providers. When run locally it will behave as it's a NodePort
apiVersion: v1
kind: Service
metadata:
  name: back-end
spec:
  type: LoadBalancer
  ports:
    - targetPort: 80
      port: 80
      nodePort: 30008

  selector:
    app: myapp
    type: back-end
```
