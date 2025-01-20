# Pods - encapsulated containers
* smallest object in Kubernetes
* usually one container per pod
* multi-container pods are not of same kind and are helper containers to your app - sidecar container

# Pod YAML: example
```
| Kind | Version | 
|:-------------|:--------------:
| Pod       |     V1    |        
| Service      |     V1    |         
| Replica Set      |     apps/V1     |         
| Deployment      |     apps/V1     |         

## example pod definiton YAML file
```
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
# Kubectl pod commands

## list pods
`kubectl get pods`
## get detailed pod information
`kubectl descibe pod pod_name`
## edit pod configuration yaml
`kubectl edit pod pod_name`
## get pods - extended information
`kubectl get pods -o wide`
## get nodes - All namespaces
`kubectl get pods -A`
## create pod
`kubectl run pod_name --image=container_image_name`
## create pod in dry run mode and output the genrated yaml
`kubectl run pod_name --image=container_image_name --dry-run=client -o yaml`

# Deploy with YAML file
## create pod from definition file
`kubectl create -f pod-definition.yaml`
## apply pod from definition file - will create if new
`kubectl apply -f pod-definition.yaml`
## create pod with wildcard
`kubectl create -f .`
## apply pod with wildcard
`kubectl apply -f .`

