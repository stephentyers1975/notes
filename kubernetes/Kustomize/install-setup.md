# Install and setup
`curl -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/refs/heads/master/hack/install_kustomize.sh" | bash`

# Build
`kustomize build kustomize_build_dir/`

* Kustomize looks for a kustomization file which containes:
  * List of all the Kubernetes manifest kustomize should manage
  * All of the customizations that should be applied
* The Kustomize build command combines all the manifests and applies the defined transforamtions
* The Kustomize build command does not apply/deploy the kubernetes resources to the cluster

# Deploying resources
`kustomize build build_dir | kubectl apply -f -`
## or using native kubectl
`kubectl apply -k kustomize_build_dir/`

# deleting resources
`kustomize build build_dir | kubectl delete -f -`
## or using native kubectl
`kubectl delete -k kustomize_build_dir/`

!["kustomize"](/images/kustomize.png)

!["kustomize2"](/images/kustomize2.png)

# Simple Example kustomization.yaml
```
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization

resources:
  - api/api-depl.yaml
  - api/api-service.yaml
  - cache/redis-config.yaml
  - cache/redis-depl.yaml
  - cache/redis-service.yaml
  - db/db-config.yaml
  - db/db-depl.yaml
  - db/db-service.yaml
```

# better per directory Example Kustomization.yaml
```
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization

resources:
  - api/
  - cache/
  - db/

```
```
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization

resources:
  - api-depl.yaml
  - api-service.yaml
```

```
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization

resources:
  - redis-depl.yaml
  - redis-service.yaml
  - redis-config.yaml
```

```
apiVersion: kustomize.config.kes.io/v1beta1
kind: Kustomization

resources:
  - db-depl.yaml
  - db-service.yaml
  - db-config.yaml
```