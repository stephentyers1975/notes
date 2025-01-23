# Resource Requests/Limits
## set resource limits in pod yaml

* Requests specify the minimum amount of CPU and memory resources required for a container to operate.
  * Kubernetes uses the requests values to schedule pods on nodes. The scheduler ensures that the node has enough resources to fulfill the requests.
* Limits specify the maximum amount of CPU and memory resources that a container is allowed to use.
  * Once a container exceeds its resource limits, Kubernetes may throttle CPU usage or kill the container if it exceeds its memory limit.
* default bahaviour is no limits or requests set
* cpu can be throttle
* memory cannot be throttle as it's assigned to processes. to free it the pod is killed.

!["cpu limits settings recomendations"](/images/cpulimits.png)
!["cpu limits settings recomendations"](/images/memorylimits.png)

* Memory
  * 1G - 1 gigabyte
  * 1M - 1 megabyte
  * 1K - 1 kilobyte
  * 1Gi - 1 gibibyte
  * 1Mi - 1 mebibyte
  * 1Ki - 1 kibibyte
* CPU
  * 1 AWS vCPU
  * 1 GCP Core
  * 1 Azure Core
  * 1 hyperthread

# Request for pod in YAML - guaranteed resource
```
apiVersion: v1
kind: Pod
metadata:
  name: simple-webapp-color
  label:
    name: simple-webapp-color
spec:
  containers:
    - name: simple-webapp-color
      image: simple-webapp-color
      ports:
        - containerPort: 8080
      resources:
        requests:
          memory: "4Gi"
          cpu: 2
  
```
# Limits for pod in YAML
```
apiVersion: v1
kind: Pod
metadata:
  name: simple-webapp-color
  label:
    name: simple-webapp-color
spec:
  containers:
    - name: simple-webapp-color
      image: simple-webapp-color
      ports:
        - containerPort: 8080
      resources:
        requests:
          memory: "4Gi"
          cpu: 2
        limits:
          memory: "2Gi"
          cpu: 2
  
```

# Set Default limits for pods
* can be set and applicable at the namespace level with limit-range yaml
## cpu
```
apiVersion: v1
kind: LimitRange
metadata:
  name: memory-resource-constraint
spec:
  limits:
  - default:
      memory: 1Gi
    defaultRequest:
      memory: 1Gi
    max:
      memory: "1G1"
    min:
      memory: 500m
    type: container
```
## update pod with limits
`kubectl get po pod_name -o yaml > pod_name.yaml`
`kubectl replace -f pod_name.yaml --force`

## memory
```
apiVersion: v1
kind: LimitRange
metadata:
  name: cpu-resource-constraint
spec:
  limits:
  - default:
      cpu: 500m
    defaultRequest:
      cpu: 500m
    max:
      cpu: "1"
    min:
      cpu: 100m
    type: container
```
## Apply limit range to namespace
`kubectl apply -f limitrange.yaml -n <namespace>`

# Constrain resouces on cluster as a whole
* use resource quotas that are set on the namespace level
```
apiVersion: v1
kind: ResourceQuota
metadata:
  name: my-resource-quota
spec:
  hard:
  requests.cpu: 4
  requests.memory: 4G1
  limits.cpu: 10
  limits.memory: 10Gi
```
## apply constraint  to namespace
`kubectl apply -f resource-quota.yaml -n <namespace>`