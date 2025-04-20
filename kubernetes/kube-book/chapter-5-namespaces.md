# Chapter 5 - Namespaces - Virtual clusters - Tenants

* Each Namespace can have its own users, RBAC rules, and resource quotas, and you can selectively apply policies to Namespaces. However, they’re not a strong workload isolation boundary, so you cannot use them for hard multi-tenancy.
* only provides soft isolation

## check if object is namespaced
`kubectl api-resources`
## set default namespace for kubectl
`kubectl config set-context --current --namespace sheild`
## reset kubeconfig to default namespace
`kubectl config set-context --current --namespace default`