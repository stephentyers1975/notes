# Scheduler
## manually scheduling pods - no scheduler - mimic scheduler 
* manualy create nodeName key value in pod definition file. This can only be done at pod creation. If existing you must delete the pod first and execute with the below command
`kubectl replace --force pod_defintion.yaml`
* or manually sending a binding request by sending a POST request in json format 
`pod_defintion.yaml`
```
apiVersion: v1
kind: Pod
metadata:
  name: nginx
spec:
  nodeName: node02
  containers:
    - image: nginx
      name: nginx
```
`bind.yaml`
```
apiVersion: v1
kind: Binding
metadata:
  name: nginx
target:
  apiVerson: v1
  Kind: Node
  name: node02
```
# use JSON converted from the pod bind yaml for POST http request
```
curl --header "Content-Type:application/json" --request POST --data '
{
  "apiVersion": "v1",
  "kind": "Binding",
  "metadata": {
    "name": "nginx"
  },
  "target": {
    "apiVerson": "v1",
    "Kind": "Node",
    "name": "node02"
  }
}'
https://SERVER/api/v1/namespaces/default/pods/$PODNAME/binding/

```