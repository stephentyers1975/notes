# JSON Path
## output json
`kubectl get pods -o json`
## construct query
`kubectl get pods -o jsonpath='{.items[0].spec.containers[0].image}'`
## example queries
`kubectl get nodes -o jsonpath='{.items[*].metadata.name}'`
`kubectl get nodes -o jsonpath='{.items[*].status.nodeinfo.architecture}'`
`kubectl get nodes -o jsonpath='{.items[*].status.capacity.cpu}'`
## merge query
`kubectl get nodes -o jsonpath='{.items[*].metadata.name}{.items[*].status.capacity.cpu}'`

# formatting
## new line
`kubectl get nodes -o jsonpath='{.items[*].metadata.name}{"\n"}{.items[*].status.capacity.cpu}'`
## tab
`kubectl get nodes -o jsonpath='{.items[*].metadata.name}{"\t"}{.items[*].status.capacity.cpu}'`

# Loops
`{range .items[*]}{.metadata.name}{"\t"}{.status.capacity.cpu}{"\n"}{end}`
# custom columns
`kubectl get nodes -o=custom-columns=NODE:.metadata.name,CPU:.status.capacity.cpu`
# sorting
`kubectl get nodes --sort-by= .metadata.name`
## sort persistent volumes by size
`kubectl get pv --sort-by=.spec.capacity.storage`
## find context
`kubectl config view --kubeconfig=my-kube-config -o jsonpath='{.contexts[?(@.context.user =="aws-user")]}' > /opt/outputs/aws-context-name`
## find and sort
`kubectl get pv -o=custom-columns=NAME:.metadata.name,CAPACITY:.spec.capacity.storage --sort-by=.spec.capacity.storage`