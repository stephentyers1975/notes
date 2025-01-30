# Service Networking

* service is a cluster wide concept
* service is accessible/hosted across the cluster
* clusterip service is only accessible from within the cluster
* NodePort service is accessible outside the cluster

!["service1"](/images/service1.png)

## view iptables rules created
`iptable -L -t nat | grep db-service`
## view kube-proxy logs
`cat /var/log/kube-proxy.log`
## view service ip range assigned -> look for --service-cluser-ip-range
`ps aux | grep kube-api-server`
## or describe/inspect logs of the kube api pod if kubeadm installed
`kubectl describe pod kube-apiserver-pod -n kube-system | grep -i cluster-ip-range`
## check proxy type kube-proxy is using
`kubectl logs kube-proxy-pod -n kube-system`
### or check the config file
`kubectl exec kube-proxy-pod -n kube-system  -- cat /var/lib/kube-proxy/config.conf `