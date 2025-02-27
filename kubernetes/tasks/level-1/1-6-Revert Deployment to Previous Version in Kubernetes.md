# Revert Deployment to Previous Version in Kubernetes
There exists a deployment named nginx-deployment; initiate a rollback to the previous revision.
## check rollout history
`kubectl rollout history deployment nginx-deployment`
## check revision in detail to see what has exactly happened
`kubectl rollout history deployment nginx-deployment --revision 2`
## rollback to last deployment undoing latest changes
`kubectl rollout undo deployment nginx-deployment`