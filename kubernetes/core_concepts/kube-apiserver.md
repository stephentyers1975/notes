# Kube-apiserver - Primary management component of kubernetes
* kubectl interacts with this API
* You could use http REST calls as well
* only component that interacts diectly with etcd
## steps to interact
1. Authenticate user
2. Validate requests
3. Retrieve data from etcd
4. update etcd
5. scheduler
6. kubelet

!["kubernetes api-server flow](/images/kube_architecture.png)

## view api-server -> kubeadm setup
`kubectl get pods -n kube-system`
## view config file -> kubeadm setup
`cat /etc/kubernetes/manifests/kube-apiserver.yaml`
## view api-server options -> non-kubeadm setup
`cat /etc/systemd/system/kube-apiserver.service`
## view running process
`ps aux : grep kube-apiserver`