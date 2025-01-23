# DaemonSets

* ensurse one copy of your pod on is running on each node of your cluster
* if a node is added to the cluster, a new pod will be spun up
* if a node is removed from the cluster, a pod will be deleted
* kube-proxy is a good use case
* networking components can be a good use case
* uses node affintiy to schedule pods on each node. Legacy used node selector

# DaemonSet yaml
```
apiVersion: apps/v1
kind: DaemonSet
metadata:
  name: monitoring-daemon
spec:
  selector: 
    matchLabels:
        app: monitoring-agent
  template:
    metadata:
      labels:
        app: monitoring-agent
    spec:
      containers:
        - name: monitoring-agent
          image: monitoring-agent
```
## create daemoSet
`kubectl create -f daemonSet_definition.yaml`
## view daemonSet
`kubectl get daemosets`
## view detaild information of daemonSet
`kubectl describe daemosets daemonSet_name`