# Kube Scheduler
* responsible for scheduling pods on nodes - doesn't actually place the pod on the node, that's the job of the kubelet to create them where the scheduler tells them to be.
1. Filter nodes: eliminates node that aren't suitable - capacity or size constraints
2. Rank nodes: Using priority function to score nodes. Calculates resources that would free after container(s) built. The more free resources left wins the ranking.

## view kube-scheduler services - kubeadm setup
`kubectl get pods -n kube-system`
## config file - kubeadm
`/etc/kubernetes/manifests/kube-scheduler.yaml`
## view process
`ps aux | grep kube-scheduler`