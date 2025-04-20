# Chapter 3 - cluster setup

1. install KIND via Docker Desktop

2. Install Linode cluster for Cloud exercises
* https://www.linode.com/lp/refer/?r=6107b344722dbd6017ea12da672510
* Cluster label: tkb
* Region: Choose a region close to you
* Kubernetes Version: Choose a recent version
* HA Control Plane: No
* Control Plane ACL: Disabled
* Add Node Pools: Select the Shared CPU tab and add 3 x Linode 2GB nodes

## Configure kubectl config file in ~/.kube directory
* config file contains
1. Clusters
2. Users (credentials) 
3. Contexts
4. Current context

* backup existing config file to config-bkp
### merge exisitng config with new linode config
`export KUBECONFIG=~/.kube/config-bkp:~/.kube/tkb-kubeconfig.yaml`
`kubectl config view`
### set current context to new linode cluster
`kubectl config get-contexts`
`kubectl config use-context lke349416-ctx`
`kubectl config current-context`



