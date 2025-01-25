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

# types of ETCD install
## Stacked etcd
* Topology: In a stacked setup, the etcd members are co-located with the Kubernetes control plane components (API server, controller manager, and scheduler) on the same nodes.

* Simplicity: Easier to set up and manage since all components are on the same nodes.

* Resource Utilization: May lead to resource contention between etcd and control plane components. Etcd is resource-intensive and might require significant disk I/O and network bandwidth2.

* Fault Tolerance: If a node fails, both the control plane instance and an etcd member are lost, potentially risking the availability and resilience of your cluster. To mitigate this, it's recommended to run a minimum of three stacked control plane nodes1.

* Infrastructure Cost: Requires fewer nodes since etcd and control plane components share the same hardware

## External etcd
* Topology: In an external setup, the etcd members run on separate nodes from the Kubernetes control plane components.

* Reliability: Provides better fault tolerance. Losing a control plane node won't affect the etcd members and vice versa2.

* Resource Isolation: Isolates etcd from control plane components, preventing resource contention. This setup can improve the performance and reliability of both etcd and the control plane2.

* Complexity: Setting up and managing an external etcd cluster is more complex and requires dedicated nodes for etcd.

* Infrastructure Cost: Requires more nodes, as you need separate nodes for the control plane and etcd cluster members

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