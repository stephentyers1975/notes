# Execute Rolling Updates in Kubernetes
Execute a rolling update for this application, integrating the nginx:1.19 image. The deployment is named nginx-deployment.
Ensure all pods are operational post-update.
## impearatively
`kubectl set image deployment nginx-deployment nginx-container=nginx:1.19`
### and edit yaml container image key
`kubectl edit deployments.apps nginx-deployment`