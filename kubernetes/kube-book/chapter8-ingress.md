# chapter 8 ingress

Ingress is defined in the networking.k8s.io/v1 API sub- group, and it requires the usual two constructs:

1. A resource 
2. A controller

The resource defines the routing rules, and the controller implements them.

# Ingress classes
Ingress classes allow you to run multiple Ingress controllers on a single cluster. The process is simple:

1. You map each Ingress controller to its own Ingress class 2. When you create Ingress objects, you assign them to an
Ingress class

# get ingress
`kubectl get ing`