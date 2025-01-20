# kube-controller-manager
## Packaged and consists of multiple controller services
* Deployment controller
* Namespace controller
* Endpoint controller
* cronjob
* job-controller
* PV-Protection-controller
* Service-Account-Controller
* Stateful-Set
* Replica-Set
* Node Controller
* PV-Binder-Controller
* Replication Controller

## node controller
* Watch status of node
* Remediate Situation
* Monitor status of nodes through kube-apiserver (5s with 40s grace period. POD eveiction timeout of 5m)

## Replication controller
* montiors status of replica sets
* ensure desired number of pods in the set are available

## view kub-controller services - kubeadm setup
`kubectl get pods -n kube-system`
## config file
`/etc/kubernetes/manifests/kube-controller-manager.yaml`
## config file for service - non kubeadm setup
`/etc/systemd/system/kube-controller-manager.service`
## view process
`ps aux | grep kube-controller-manager`

