# working with Pods
## complete list of pod attributes
`kubectl explain pods --recursive | more`
## drill into detail of an attribute
`kubectl explain pod.spec.restartPolicy`

## Deploying a pod includes the following steps
1. Define the Pod in a YAML manifest file
2. Post the manifest to the API server
3. The request is authenticated and authorized
4. The Pod spec is validated
5. The scheduler filters nodes based on nodeSelectors, affinity
and anti-affinity rules, topology spread constraints, resource
requirements and limits, and more
6. The Pod is assigned to a healthy node meeting all
requirements
7. The kubelet on the node watches the API server and notices
the Pod assignment
8. The kubelet downloads the Pod spec and asks the local
runtime to start it
9. The kubelet monitors the Pod status and reports status
changes to the API server