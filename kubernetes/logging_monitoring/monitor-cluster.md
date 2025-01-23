# Monitor cluster components

* Kubelet service monitors node
* cAdvisor inside kubelet collects pod performance metrics and exposes them via the kube-api

# metrics server

## minikub install
`minikube addons enable metrics-server`
## others
`git clone https://github.com/kubernetes-incubator/metrics-server.git`
## install as pods
`kubectl create -f deploy/1.8+/`
## view node summary metrics
`kubectl top node`
## view pod summary metrics
`kubectl top pod`