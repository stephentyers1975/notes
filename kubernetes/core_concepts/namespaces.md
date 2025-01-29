# Namespaces - isolation
## default namespaces
* Default
* kube-system
* kube-public

!["namespaces"](/images/kube-namespaces.png)

## service connection to namespace with an app
### within current namespace
`mysql.connect("db-service")`
### to another namespace called dev
`mysql.connect("db-service.dev.svc.cluster.local")`

# Commands
## list pods in another namespace
`kubectl get pods --namespace=kube-system`
## create pod in another namespace
`kubectl create -f pod-definition.yaml --namespace=dev`
## Or add namespace to pod definition file under metadata as below
```
apiVersion: v1
kind: Pod
metadata:
  name: nginx
  namespace: dev
  labels:
    app: nginx
    tier: frontend
spec:
  containers:
    - name: nginx
      image: nginx
```
## create namespace
```
apiVersion: v1
kind: Namespace
metadata:
  namespace: dev
```
`kubectl create -f namespace-dev.yaml`
### or
`kubectl create namespace namespace_name`
## switch to namespace
`kubectl config set-context $(kubectl config current-context) --namespace=dev`
## view pods in all namespaces
`kubectl get pods --all-namespaces`

* use kubens for easier switch
## switch to a new namespace
`kubens`
## switch to previous namespace
`kubens -`

# Resource quota - limits resource in a namespace
```
apiVersion: v1
kind: ResourceQuota
metadata:
  name: compute-quota
  namespace: dev
spec:
  hard:
    pods: "10"
    requests.cpu: "4"
    requests.memory: 5Gi
    limits.cpu: "10"
    limits.memory: 10Gi
```
`kubectl create -f compute-quota.yaml`

