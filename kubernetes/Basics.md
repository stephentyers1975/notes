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
## create pod
`kubectl run pod_name --image=container_image_name`
## list pods
`kubectl get pods`
## get detailed pod information
`kubectl descibe pod pod_name`

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

## create pod from definition file
`kubectl create -f pod-definition.yaml`
## apply pod from definition file - will create if new
`kubectl apply -f pod-definition.yaml`