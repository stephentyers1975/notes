# service accounts

## create service accounts
`kubectl create serviceaccount svcacc_name`
## view service accounts
`kubectl get serviceaccount`
## view detail of service account -> shows token name
`kubectl describe serviceaccount svcacc_name`
* token stored inside secret
## view token
`kubectl describe secret token_name`

* token can be used as bearer header in REST call to api
* for application running as pod, mount secret containing token directly into pod for app to use
* defaultly mounted in pod at /var/run/secrets/kubernets.io/serviceaccount
## view secret inside pod
`kubectl exec -it pod_name ls /var/run/secrets/kubernets.io/serviceaccount/token`
* decode token with tool or JWT website
* new version uses TokenRequestAPI and mounts as projected volume 
* v1.24 no longer automatically creates a secret
* you must run ->  kubectl create token pod_name

