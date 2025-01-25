# Contexts
## list all configured cluster
`kubectl config view`
## list kubectl contexts
`kubectl config get-clusters`
## kubectl switch to  contexts
`kubectl config use-context context_name`
## check external etcd - check --etcd-servers value
`kubectl describe pod kube-apiserver-cluster2-controlplane -n kube-system | grep -i etcd`
### or look at the process on control plane
`ssh cluster2-controlplane ps -ef | grep --color=auto etcd`