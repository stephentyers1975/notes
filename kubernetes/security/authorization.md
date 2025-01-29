# Authorisation
## modes
* NODE
* ABAC
* RBAC
* WEBHOOK
* AlwaysAllow
* AlwaysDeny

* Mode is set in --authorization-mode in service file or yaml
* default is --authorization-mode=AlwaysAllow
* provide comma spearated list of modes
* --authorization-mode=Node,RBAC,Webhook

# RBAC
## 1. Create role
`developer-role.yaml`
```
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  name: developer
rules:
- apiGroups: [""] # "" indicates the core API group
  resources: ["pods"]
  verbs: ["list", "get", "create", "update", "delete"]
- apiGroups: [""] # "" indicates the core API group
  resources: ["ConfigMap"]
  verbs: ["create"]
```
`kubectl create -f developer.yaml`
## granualar role by restricting to certain pod name
```
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  name: developer
rules:
- apiGroups: [""] # "" indicates the core API group
  resources: ["pods"]
  verbs: ["list", "get", "create", "update", "delete"]
  resourceNames: ["blue", "orange"]
```

## 2. link user to role through role binding
`devuser-developer-binding.yaml`
```
apiVersion: rbac.authorization.k8s.io/v1
# This role binding allows "jane" to read pods in the "default" namespace.
# You need to already have a Role named "pod-reader" in that namespace.
kind: RoleBinding
metadata:
  name: devuser-developer-binding
subjects:
# You can specify more than one "subject"
- kind: User
  name: dev-user # "name" is case sensitive
  apiGroup: rbac.authorization.k8s.io
roleRef:
  # "roleRef" specifies the binding to a Role / ClusterRole
  kind: Role #this must be Role or ClusterRole
  name: developer # this must match the name of the Role or ClusterRole you wish to bind to
  apiGroup: rbac.authorization.k8s.io
```
## create role binding
`kubectl create -f devuser-developer-binding.yaml`
## view rbace roles
`kubectl get roles`
## view rbac rolebindings
`kubectl get rolebindings`
## view more detail of rbac roles
`kubectl describe role developer`
## view more detail of role binding
`kubectl describe rolebinding devuser-developer-binding`
## check current access
`kubectl auth can-i create deployments`
`kubectl auth can-i delete nodes`
## impersonate other user as administrator to check permissions
`kubectl auth can-i create deployments --as dev-user`
`kubectl auth can-i create pods --as dev-user`
`kubectl auth can-i create pods --as dev-user --namespace dev`

# cluster roles - cluster wide resources
* cluster admin role
* storage admin role

# 1. create cluster role yaml file
`cluster-admin-role.yaml`
```
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: cluster-administrator
rules:
- apiGroups: [""]
  resources: ["nodes"]
  verbs: ["get", "watch", "list", "create"]
```
## create cluster role
`kubectl create -f cluster-admin-role.yaml`

# 1. create cluster role binding yaml file
`cluster-admin-role-binding.yaml`
```
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: cluster-admin-role-binding
subjects:
- kind: User
  name: cluster-admin
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: ClusterRole 
  name: cluster-admin
  apiGroup: rbac.authorization.k8s.io
```
## create cluster role binding
`kubectl create -f cluster-admin-role-binding.yaml`
## view available API and resource names that can be assigned
`kubectl api-resources`