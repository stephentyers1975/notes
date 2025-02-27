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
## get pods - All namespaces
`kubectl get pods -A`
## get pods with filtering for running
`kubectl get pods --field-selector=status.phase=Running`
## create pod
`kubectl run pod_name --image=container_image_name`
## create pod and expose container port
`kubectl run custom-nginx --image=nginx --port=8080`
## create pod and expose container port and creates ClusterIP service in one command. Must use --port and --expose together.
`kubectl run httpd --image=httpd:alpine --port=80 --expose`
## create pod in dry run mode and output the genrated yaml
`kubectl run pod_name --image=container_image_name --dry-run=client -o yaml`
## expose pod to a service defined with a ClusterIP
`kubectl expose pod redis --type=ClusterIP --name=redis-service --port=6379`
## view pod logs 
`kubectl logs pod_name`
## view container logs inside pod
`kubectl logs pod_name -c container_name`
## execute a command inside a pod
`kubectl exec <pod-name> -- ls /tmp`
## attach to an interactive shell insidw epod
`kubectl exec -it <pod-name> -- /bin/bash`

# Deploy with YAML file
## create pod from definition file
`kubectl create -f pod-definition.yaml`
## apply pod from definition file - will create if new
`kubectl apply -f pod-definition.yaml`
## create pod with wildcard
`kubectl create -f .`
## apply pod with wildcard
`kubectl apply -f .`
# Replace a pod using the data in pod.json
`kubectl replace -f ./pod.json`
# Replace a pod based on the JSON passed into stdin
`cat pod.json | kubectl replace -f -`
# Update a single-container pod's image version (tag) to v4
`kubectl get pod mypod -o yaml | sed 's/\(image: myimage\):.*$/\1:v4/' | kubectl replace -f -`
# Force replace, delete and then re-create the resource
`kubectl replace --force -f ./pod.yaml`
