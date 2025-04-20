# chapter15 The Kubernetes API

* common for the API server to be exposed on port 443 or 6443
* All kubectl commands go to the API server (creating, retrieving, updating, and deleting objects)
* All kubelets watch the API server for new tasks and report the status to the API server
* All control plane services share data and status info via the API server

## Expose api on localhost
`kubectl proxy --port 9000 &`

There are two types of API group: 
* The core group
* The named groups

The core API group
The core group is where we define all the original objects from when Kubernetes was new (before it grew and we divided the API into groups). Some of the resources in this group include Pods, Nodes, Services, Secrets, and ServiceAccounts, and you can find them in the API below the /api/v1 REST path. The following table lists some example paths for resources in the core group.

Resource REST Path
Pods        /api/v1/namespaces/{namespace}/pods/
Services    /api/v1/namespaces/{namespace}/services/
Nodes       /api/v1/nodes/
Namespaces  /api/v1/namespaces/

Named API groups
The named API groups are where we add all new resources, and we sometimes call them sub-groups. The apps group defines resources such as Deployments, StatefulSets, and DaemonSets that manage application workloads. Likewise, we define Ingresses, Ingress Classes, and Network Policies in the networking.k8s.io group.

Resource        Path
Ingress         /apis/networking.k8s.io/v1/namespaces/{name
ClusterRole     /apis/rbac.authorization.k8s.io/v1/clusterroles/
StorageClass    /apis/storage.k8s.io/v1/storageclasses/