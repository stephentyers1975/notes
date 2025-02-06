# Patches
* inline with kustomization.yaml file
* separate file referenced in kustomization.yaml file

## JSON 6902 patch - inline

```
patches:
  - target:
      kind: Deployment
      name: api-deployment
    patch: |-
      - op: replace
        path: /spec/replicas
        value: 5
```
## Strategic merge patch - inline
```
patches:
  - patch: |-
      apiVersion: apps/v1
      kind: Deployment
      metadata:
        name: api-deployment
      spec:
        replicas: 5
```

## separate patch filefile
`kustomization.yaml`
```
patches:
  - replica-path.yaml
  - target:
      kind: Deployment
      name: api-deployment
```
`replica-patch.yaml`
```
- op: replace
  path: /spec/replicas
  value: 5
```

## Patches Dictionary
## JSON 6902 patch - inline add

```
patches:
  - target:
      kind: Deployment
      name: api-deployment
    patch: |-
      - op: add
        path: /spec/template/metadata/labels/org
        value: KodeKloud
```

## Strategic merge patch - inline add
```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: api-deployment
spec:
  template:
    metadata:
      labels:
        org: KodeKloud
        
```
## JSON 6902 patch - inline remove

```
patches:
  - target:
      kind: Deployment
      name: api-deployment
    patch: |-
      - op: remove
        path: /spec/template/metadata/labels/org
```

## Strategic merge patch - inline remove
```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: api-deployment
spec:
  template:
    metadata:
      labels:
        org: null
        
```
# Patches List - JSON 6902
```
patches:
  - target:
      kind: Deployment
      name: api-deployment
    patch: |-
      - op: replace
        path: /spec/template/spec/containers/0
        value:
          name: haproxy
          image: haproxy
```
# Patches List - strategic merge
```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: api-deployment
spec:
  template:
    spec:
      containers:
        - name: nginx
          image: haproxy
```
# Patches List - JSON 6902 - ADD
```
patches:
  - target:
      kind: Deployment
      name: api-deployment
    patch: |-
      - op: add
        path: /spec/template/spec/containers/-
        value:
          name: haproxy
          image: haproxy
```
# Patches List - strategic merge - ADD
```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: api-deployment
spec:
  template:
    spec:
      containers:
        - name: nginx
          image: haproxy
```
# Patches List - JSON 6902 - remove
```
patches:
  - target:
      kind: Deployment
      name: api-deployment
    patch: |-
      - op: remove
        path: /spec/template/spec/containers/1
```
# Patches List - strategic merge - remove
```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: api-deployment
spec:
  template:
    spec:
      containers:
        - $patch: delete
          name: database
```