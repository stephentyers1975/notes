# rolling updates rollback

* 2 stratagies
* RollingUpdate - default
* recreate
## create deployment
`kubectl create -f deployment_definition.yaml`
## view deployment
`kubectl get deployments`
## declarative update by editing deployment_definition.yaml
`kubectl apply -f deployment_definition.yaml`
## imperative update - does not change original definition yaml file
`kubectl set image deployment/deployment_name image_name`
## view rollout status
`kubectl rollout status deployment/deployment_name`
## view rollout history
`kubectl rollout history deployment/deployment_name`
## view deployment details - strategytype
`kubectl describe deployment deployment_name`
## view replica sets
`kubectl get replicasets`
# rollback deployment 
`kubectl rollout undo deployment/myapp-deployment`