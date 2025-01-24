# Backup and restore

## what to backup
* Resource configuration
* ETCD
* Volume data

# Resource configuration backup - kube-apiserver method
* store in repo
* 3rd party services
## query kube-apiserver
`kubectl get all --all-namespaces -o yaml > all-deploy-services.yaml`

# ETCD backup
* backup data directory --data-dir=/var/lib/etcd
* snapshot using built in tool etcdctl
* specify endpoints, cacert, cert and key when using etcdctl
  * --endpoints=https://127.0.0.1:2379 \
  * --cacert=/etc/etcd/ca.crt \
  * --cert=/etc/etcd/etcd-server.crt \
  * --key=/etc/etcd/etcd-server.key
* export ETCDCTL_API=3

## create snapshot
`etcdctl snapshot save snapshot.db`
### example
`etcdctl snapshot save /opt/snapshot-pre-boot.db --endpoints=https://127.0.0.1:2379 --cacert=/etc/kubernetes/pki/etcd/ca.crt --cert=/etc/kubernetes/pki/etcd/server.crt --key=/etc/kubernetes/pki/etcd/server.key`
## view status of snapshot
`etcdctl snapshot status snapshot.db`
## restore from snapshot
### step 1
`service kube-apiserver stop`
`etcdctl snapshot restore snapshot.db --data-dir /var/lib/etcd-from-backup`
### step 2
* edit etcd.service unit file --data-dir to point at new file
`systemctl reload daemon`
`service etcd restart`
* etcd is container via kubeadm install edit vim /etc/kubernetes//manifests/etcd.yaml and update the volume location for etcd-data
* once edited watch for pod to be created by kubelet check with below command to watch progress
`watch "crictl ps | grep etcd"`
* If the etcd pod is not getting Ready 1/1, then restart it by kubectl delete pod -n kube-system etcd-controlplane and wait 1 minute.

## kubeadm install restore
### backup etcd db
`export ETCDCTL_API=3`
`etcdctl snapshot save /opt/snapshot-pre-boot.db --endpoints=https://127.0.0.1:2379 --cacert=/etc/kubernetes/pki/etcd/ca.crt --cert=/etc/kubernetes/pki/etcd/server.crt --key=/etc/kubernetes/pki/etcd/server.key`
## restore data
`etcdctl snapshot restore --data-dir=/var/lib/etcd-from-backup /opt/snapshot-pre-boot.db`
## edit /etc/kubernetes/manifests/etcd.yam;
`vim /etc/kubernetes/manifests/etcd.yaml`
* wait for etcd pod to be recreated
`watch "crictl ps | grep etcd"`
`kubectl get pods -n kube-system`
## if it doesn't work try
`systemctl restart kubelet`
