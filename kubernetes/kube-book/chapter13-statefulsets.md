# chapter 13 Stateful sets

StatefulSets offer the following three features that Deployments do not:
1. Predictable and persistent Pod names and DNS names 
2. Predictable and persistent volume bindings
3. Predictable startup and shutdown order

* The format of StatefulSet Pod names is <StatefulSetName>- <Integer>. The integer is a zero-based index ordinal, which is a fancy way of saying number starting from zero.

* StatefulSet controller does its own self-healing and scaling. This is architecturally different from Deployments, which use the ReplicaSet controller for these operations.

* deleting a StatefulSet object does not terminate its Pods in an orderly manner. This means you should scale a StatefulSet to zero replicas before deleting it!

* Secondly, you can use terminationGracePeriodSeconds to further control Pod termination. For example, it’s common to set this to at least 10 seconds to give applications time to flush any buffers and safely commit writes that are still in flight.

## volumes

* When the StatefulSet controller creates Pods, it also creates any volumes they require. To help with this, Kubernetes gives the volumes special names linking them to the correct Pods.

## Network ID and headless Services

* Instead of using regular Kubernetes Services that load-balance requests across a set of Pods, StatefulSets use a special kind of Service called a headless Service. These create predictable DNS names for each StatefulSet Pod so that apps can query DNS (the service registry) for the full list of Pods and then connect directly to specific Pods.

## watch ramp up of pod builds in order
`kubectl get sts --watch`

* It’s worth noting that Kubernetes puts scale-down operations on hold if any of the Pods are in a failed state. This protects the resiliency of the app and the integrity of any data.

* You can also change how the StatefulSet controller starts and stops Pods by tweaking its property. The default setting is   and enforces the behavior of starting one Pod at a time and waiting for the previous Pod to be running and ready before starting the next. Changing the value to Parallel will cause the StatefulSet to act more like a Deployment where Pods are created and deleted in parallel.