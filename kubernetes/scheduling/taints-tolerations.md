# Taints & Tolerations

## Add taint to node - options -> NoSchedule | PreferNoSchedule | NoExecute
`kubectl taint nodes node-name key=value:taint-effect`
## example
`kubectl taint nodes node1 app=blue:NoSchedule`
## remove taint from control-plane
`kubectl taint nodes controlplane node-role.kubernetes.io/control-plane:NoSchedule-`
* Taint is automatically setup on master node to prevent any pods being scheduled on that node.
`kubectl describe node kubemaster | grep Taint`

## Add toleration to pod
`pod-defintion.yml`
```
apiVersion: v1
kind: Pod
metadata:
  name: myapp-pod
spec:
  containers:
    - name: nginx-container
      image: nginx
  tolerations:
  - key: "app"
    operator: "Equal"
    value: "blue"
    effect: "NoSchedule" 
```