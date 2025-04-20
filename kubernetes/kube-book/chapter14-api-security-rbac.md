# chapter14-api-security-rbac

## Authentication

* Authentication is about proving your identity. You might see or hear it shortened to authN, pronounced “auth en”.

* Credentials are at the heart of authentication, and all requests to the API server include credentials. It’s the responsibility of the authentication layer to verify them. If verification fails, the API server returns an HTTP 401 and denies the request. If the request passes authentication, it moves on to authorization.

* The Kubernetes authentication layer is pluggable, and popular modules include client certificates, webhooks, and integration with external identity management systems such as Active Directory (AD) and cloud-based Identity Access Management (IAM) systems. In fact, Kubernetes does not have its own built- in identity database. Instead, it forces you to use an external system. This avoids creating yet another identity management silo.

* Out-of-the-box, most Kubernetes clusters support client certificates, but in the real world you’ll want to integrate with your chosen cloud or corporate identity management system. Many hosted Kubernetes services automatically integrate with the underlying cloud’s identity management system.

In these situations, Kubernetes offloads authentication to the external system.
 - contains below
* Clusters
* Users
* Contexts 
* Current-context

## Authorization (RBAC)

Authorization happens immediately after successful authentication, and you’ll sometimes see it shortened to authZ (pronounced “auth zee”).

1. Users
2. Actions
3. Resources

Which users can perform which actions against which resources.

## Kubernetes RBAC

Two concepts are vital to understanding Kubernetes RBAC:
1. Roles 
2. RoleBindings

Roles define a set of permissions, and RoleBindings bind them to users

### Role Objects

Role objects have a rules section that defines the following three properties:
1. verbs 
2. apiGroups 
3. resources

### view API resources
`kubectl api-resources --sort-by name -o wide`

##Cluster-level users and permissions
So far, you’ve seen Roles and RoleBindings. However, Kubernetes actually has four RBAC objects:
* Roles
* RoleBindings 
* ClusterRoles 
* ClusterRoleBindings

### Describe cluster role
`kubectl describe clusterrole cluster-admin`
### check cluster has any ClusterRoleBindings referencing the cluster-admin role
`kubectl get clusterrolebindings | grep cluster-admin`
`kubectl describe clusterrolebindings kubeadm:cluster-admins`

# Summarizing authorization

* Authorization ensures authenticated users are allowed to execute actions. RBAC is a popular Kubernetes authorization module that implements least privilege access based on a deny- by-default model that denies all actions unless you create rules that allow them.

* Kubernetes RBAC uses Roles and ClusterRoles to grant permissions, and it uses RoleBindings and ClusterRoleBindings to bind those permissions to users.

* Once a request passes authentication and authorization, it moves to admission control.

# Admission control

Admission control runs immediately after successful authentication and authorization and is all about policies.

Kubernetes supports two types of admission controllers:
* Mutating 
* Validating

The names tell you a lot. Mutating controllers check for compliance and can modify requests, whereas validating
controllers check for compliance but cannot modify requests.
Kubernetes always runs mutating controllers first, and both types only apply to requests attempting to modify the cluster. Read requests are not subjected to admission control.

## example
`kubectl describe pod kube-apiserver-desktop-control-plane --namespace kube-system | grep admission`