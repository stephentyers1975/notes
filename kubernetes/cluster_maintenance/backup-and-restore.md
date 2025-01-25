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

## kubeadm install restore - stacked ETCD - pod based on control plane
### check etcd config
`kube describe pod kube-apiserver-pod -n kube-system`
### or just check if the etcd pod is present
`kubectl get pods -n kube-system`
### backup etcd db
`export ETCDCTL_API=3`
`etcdctl snapshot save /opt/snapshot-pre-boot.db --endpoints=https://127.0.0.1:2379 --cacert=/etc/kubernetes/pki/etcd/ca.crt --cert=/etc/kubernetes/pki/etcd/server.crt --key=/etc/kubernetes/pki/etcd/server.key`
### restore data
`etcdctl snapshot restore --data-dir=/var/lib/etcd-from-backup /opt/snapshot-pre-boot.db`
### edit /etc/kubernetes/manifests/etcd.yam;
`vim /etc/kubernetes/manifests/etcd.yaml`
* wait for etcd pod to be recreated
`watch "crictl ps | grep etcd"`
`kubectl get pods -n kube-system`
### if it doesn't work try
`systemctl restart kubelet`

## kubeadm install restore - External ETCD - running as service on external server
## External etcd
### check external etcd config from control plane node
`ps aux | grep -i --color etcd`
### or
`kubectl describe pod kube-apiserver-pod -n kube-system | grep etcd`
## check ETCD config on external ETCD server
`cat /etc/systemd/system/etcd.service`
### or
`systemctl status --type=service | grep etcd`
### check number members in etcd cluster 
```
ETCDCTL_API=3 etcdctl \
  --endpoints=https://127.0.0.1:2379 \
  --cacert=/etc/etcd/pki/ca.pem \
  --cert=/etc/etcd/pki/etcd.pem \
  --key=/etc/etcd/pki/etcd-key.pem \
   member list
```
### restore file
`etcdctl snapshot restore --data-dir=/var/lib/etcd-data-new /var/lib/cluster2.db`
### edit service config to reflect new restore data location of etcd
`vim /etc/systemd/system/etcd.service`
### enable etcd owns new data folder
`chown -R etcd:etcd /var/lib/etcd-data-new/`
### reload daemon service to read new service unit file config
`systemctl daemon-reload`
### restart systemd service
`systemctl restart etcd.service`

