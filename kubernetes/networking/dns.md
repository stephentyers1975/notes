# DNS

## hostname path hierachy and FQDN for services
* services resolution
* Hostname.Namespace.Type.Root -> IP Address of service
* web-service.apps.svc.cluster.local

!["DNS for services"](/images/dns1.png)

## hostname path hierachy and FQDN for POD
* POD resolution
* ip-address-dashed.Namespace.Type.Root -> IP Address of pod
* 10-244-2-5.apps.pod.cluster.local

!["DNS for pods"](/images/dns2.png)

# Core DNS

* `/etc/coredns/Corefile`
* `kubectl describe pod coredns_pod -n kube-system`
* `kubectl describe configmap coredns`


