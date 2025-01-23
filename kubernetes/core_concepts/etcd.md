# ETCD
* distributed reliable key value store for Kubernetes DB
* etcdctl - etcd control client
* listens on 2379

## store key-value pair
`etcdctl set key1 value1`
## get key-value pair
`etcdctl get key1`
## put key-value pair
`etcdctl put key2 value2`
## list all commands
`etcdctl`
## list ctl and api version
`etcdctl --version`
`etcdctl version`
## set API version
`ETCDCTL_API=3`
`export ETCDCTL_API=3`

# ETCD in Kubernetes
## stores the below in DB cluster
* Nodes
* PODS
* Configs
* Secrets
* Accounts
* Roles
* Bindings
* Others

# ETCD version 2 commands
```
etcdctl backup
etcdctl cluster-health
etcdctl mk
etcdctl mkdir
etcdctl set
```

# ETCD version 3 commands
```
etcdctl snapshot save
etcdctl endpoint health
etcdctl get
etcdctl put
```

# ETCD Certificate paths
```
--cacert /etc/kubernetes/pki/etcd/ca.crt
--cert /etc/kubernetes/pki/etcd/server.crt
--key /etc/kubernetes/pki/etcd/server.key
```
## example etcd command - specify certificate paths
```
kubectl exec etcd-controlplane -n kube-system -- sh -c "ETCDCTL_API=3 etcdctl get / \
  --prefix --keys-only --limit=10 / \
  --cacert /etc/kubernetes/pki/etcd/ca.crt \
  --cert /etc/kubernetes/pki/etcd/server.crt \
  --key /etc/kubernetes/pki/etcd/server.key"
```