# chapter 10 service registry

* The job of a service registry is to maintain a list of Service names and their associated IP addresses.
* The Deployment is usually called coredns or kube-dns, and the Service is always called kube-dns
`kubectl get pods -n kube-system -l k8s-app=kube-dns`
`kubectl get deploy -n kube-system -l k8s-app=kube-dns`
`kubectl get svc -n kube-system -l k8s-app=kube-dns`

# Service registration

1. Give the Service a name - Developer
2. Assign the Service an IP - Kubernetes
3. Register the name and IP with the cluster DNS/kube-dns - kubernetes
4. Create local routing rules (IPVS) so that requests to the Service’s ClusterIP get routed to Pods. - Kubernetes

* You deploy a new app defined in a YAML file describing a Deployment and a Service. You post it to Kubernetes, where it’s authenticated and authorized. Kubernetes allocates a ClusterIP to the Service and persists its configuration to the cluster store. The cluster DNS observes the new Service and registers the appropriate DNS A and SRV records. Associated EndpointSlice objects are created to hold the list of healthy Pod IPs that match the Service’s label selector. The kube-proxy process on every cluster node observes the new objects and creates local routing rules (IPVS) so that requests to the Service’s ClusterIP get routed to Pods.

# Service discovery

* Kubernetes configures every container to use the cluster DNS for service discovery. It does this by automatically configuring every container’s
/etc/resolv.conf file with the IP address of the cluster DNS Service. It also adds search domains to append to unqualified names.
(FQDN) such as ent.default.svc.cluster.local 

# Service discovery and Namespaces
* automatically appends namespace fqdn to host on lookup
* curl ent:8080 -> dev namespace
* you must append fqdn of other namespace to look up
* curl ent.prod.svc.cluster.local:8080

# troubleshooting
* The ClusterIP address for the kube-dns Service must match the IP address in the /etc/resolv.conf files of all containers on the cluster.
`kubectl get svc kube-dns -n kube-system`
* The associated kube-dns EndpointSlice object should also be up and have the IP addresses of the coredns Pods listening on port
53
* kubectl get endpointslice -n kube-system -l k8s-app=kube-dns
* use a util pod
* kubectl run -it dnsutils \
  --image registry.k8s.io/e2e-test-images/jessie-dnsutils:1.7
* nslookup kubernetes
* delete core dns pods to get them to restart
`kubectl delete pod -n kube-system -l k8s-app=kube-dns`

* Kubernetes uses the internal cluster DNS for service registration and service discovery. It’s a Kubernetes-native application that watches the API server for newly created Service objects and automatically registers their names and IPs. The kubelet on each node also configures all containers to use the cluster DNS for service discovery.

* The cluster DNS resolves Service names to ClusterIPs. These are stable virtual IPs on a special network called the service network. There are no routes to this network, but the kube- proxy configures all cluster nodes to redirect ClusterIP traffic to Pod IPs on the Pod network.