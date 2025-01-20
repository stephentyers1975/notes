# Kube Proxy
* connects to every pod/node through POD network(many solutions available)
* process that runs on each node in cluster
* looks for new services on each node and creates appropriate rules on each nodes to forward the right traffic to the services and to the backend pods. Utlilizes Iptables.

!["kube proxy"](/images/kube-proxy.png)

## install kube-proxy
`wget https://storage.googleapis.com/kuberbetes-release/release/v1.13.0/bin/linux/amd64/kube-proxy`
`kube-proxy.service`
## view kube-proxy services - kubeadm setup
`kubectl get pods -n kube-system`
## deployed as daemon set
`kubectl get daemonset -n kube-system`
