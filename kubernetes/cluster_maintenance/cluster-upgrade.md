# cluster upgrade

* components can be at different versions
* components should never be at version higher than kube-apiserver
* kubernetes only support two versions prior 
* recommend upgrading one minor version at a time rather than jumping

!["cluster upgrade](/images/cluster-upgrade1.png)

# options for upgrade
* cloud provider
* kubeadm
* manual

# steps
* upgrade master first - pods continue to run
* strategy 1 upgrade all nodes - pods are down
* strategy 2 - upgrade one node at a time
* strategy 3 - add new nodes to cluster with newer version. move pods to new node and delete legacy nodes
* check kubernetes docs

# upgrade steps andcommands
## plan command to give componenent version and upgradable versions plan
* kubeadm does not install or upgrade kubelets

## Master nodes
`kubeadm upgrade plan`
## or specific version rather than latest
`kubeadm upgrade plan v_num`
## step 1 -> kubeam tool upgrade
`apt-get upgrade -y kubeadm=1.12.0-00`
## step 2 -> upgrade cluser
`kubeadm upgrade apply`
## step 3 -> upgrade kubelets on each master node (you may or may not have them installed on the master nodes)
`apt-get upgrade -y kubelet=1.12.0-00`
## restart kubelet service
`systemctl restart kubelet`
## check version
`kubectl get nodes`

# worker nodes
## step 1 -> move pods safety off node to another node and cordons node
`kubectl drain node_name`
## step 2 -> kubeam tool upgrade
`apt-get upgrade -y kubeadm=1.12.0-00`
## step 3 -> upgrade kubelets on each worker node 
`apt-get upgrade -y kubelet=1.12.0-00`
## step 4 -> upgrade node config for new kubelet version
`kubeadm upgrade node config --kube-version v1.12.0`
## restart kubelet service
`systemctl restart kubelet`
## step 5 -> uncordon node
`kubectl uncordon node_name`
## repeat with other nodes

