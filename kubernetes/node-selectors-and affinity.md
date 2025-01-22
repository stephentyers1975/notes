# Node selectors and affinity

## Node selector in pod definition file
* assign label to node and reference this in nodeSelector dictionary in the pod definition file as below:
* limited to one assignment and can't deal with advanced/multiple conditions

## label node
`kubectl label nodes <node-name> <label-key>=<label-value>`
`kubectl label nodes node01 size=large`
## list labels on node
`kubectl label nodes node01 --list`
## show all labels on all nodes
`kubectl get nodes --show-labels`

## pod definition file
```
apiVersion: v1
kind: Pod
metadata:
  name: mypod-app
spec:
  containers:
  - name: data-processor
    image: data-processor
  nodeSelector:
    size: Large
```

# Node affinity

## node affintiy types
* Available:
  * requiredDuringSchedulingIgnoredDuringExecution
  * preferredDuringSchedulingIgnoredDuringExecution
* Planned:
  * requiredDuringSchedulingRequiredDuringExecution
  * preferredDuringSchedulingRequiredDuringExecution

## YAML example
```
apiVersion: v1
kind: Pod
metadata:
  name: mypod-app
spec:
  containers:
  - name: data-processor
    image: data-processor
  affinity:
    nodeAffinity:
      requiredDuringSchedulingIgnoreDuringExecution:
        nodeSelectorTerms:
        - matchExpressions:
          - key: size
            operator: Exists
```
```
apiVersion: apps/v1
kind: Deployment
metadata:
  creationTimestamp: null
  labels:
    app: blue
  name: blue
spec:
  replicas: 3
  selector:
    matchLabels:
      app: blue
  strategy: {}
  template:
    metadata:
      creationTimestamp: null
      labels:
        app: blue
    spec:
      affinity:
        nodeAffinity:
          requiredDuringSchedulingIgnoredDuringExecution:
            nodeSelectorTerms:
            - matchExpressions:
              - key: color
                operator: In
                values:
                - blue
      containers:
      - image: nginx
        name: nginx
        resources: {}
status: {}
```
```
apiVersion: apps/v1
kind: Deployment
metadata:
  creationTimestamp: null
  labels:
    app: red
  name: red
spec:
  replicas: 2
  selector:
    matchLabels:
      app: red
  strategy: {}
  template:
    metadata:
      creationTimestamp: null
      labels:
        app: red
    spec:
      affinity:
        nodeAffinity:
          requiredDuringSchedulingIgnoredDuringExecution:
            nodeSelectorTerms:
            - matchExpressions:
              - key: node-role.kubernetes.io/control-plane
                operator: Exists
      containers:
      - image: nginx
        name: nginx
        resources: {}
status: {}
```

* Use a combination of taints/tolerances and node affinity to dedicate nodes to certain pods.