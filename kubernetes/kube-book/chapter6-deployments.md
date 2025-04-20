# Chapter 6 Deployments

* Deployments -> Rollouts/Rollbacks
* Replicasets -> Scaling, self healing
* Template -> Pods template
* Template Spec -> container spec

* Horizontal Pod Autoscaler 
* Vertical Pod Autoscaler 
* Cluster Autoscaler

## view rollout progress
`kubectl rollout status deployment hello-deploy`
## pause a rollout if still rolling out
`kubectl rollout pause deploy hello-deploy`
## resume rollout
`kubectl rollout resume deploy hello-deploy`
## view rollout history
`kubectl rollout history deploy hello-deploy`
## rollback imperatively
`kubectl rollout undo deployment hello-deploy --to-revision=1`

* pod-template-hash label connects Deployments to ReplicaSets, and ReplicaSets to Pods
* stops previously created static pods with same pod template metadata labels being seized by deployment controlla as in past versions of Kubernetes