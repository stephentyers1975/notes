# Setup Kubernetes Namespaces and PODs
Create a namespace named dev and deploy a POD within it. Name the pod dev-nginx-pod and use the nginx image with the latest tag. Ensure to specify the tag as nginx:latest.

Note: The kubectl utility on jump_host is configured to operate with the Kubernetes cluster.

## imperative
`kubectl create namaspace dev`
`kubectl run dev-nginx-pod --image nginx:latest --namespace dev`
## Declarative
```
apiVersion: v1
kind: Pod
metadata:
  labels:
    run: dev-nginx-pod
  name: dev-nginx-pod
  namespace: dev
spec:
  containers:
  - image: nginx:latest
    name: dev-nginx-pod
```