# Chapter 7 services

* Every time you create a Service, the EndpointSlice controller automatically creates an associated EndpointSlice object. Kubernetes then watches the cluster, looking for Pods matching the Service’s label selector. Any new Pods matching the selector
gets added to the EndpointSlice, whereas any deleted Pods get removed.
EndpointSlice objects keep an up-to-date list of healthy Pods matching the label selector