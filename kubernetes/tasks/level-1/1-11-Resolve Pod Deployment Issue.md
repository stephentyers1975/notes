# Resolve Pod Deployment Issue
There is a pod named webserver, and the container within it is named nginx-container, its utilizing the nginx:latest image.

Additionally, there's a sidecar container named sidecar-container using the ubuntu:latest image.

Identify and address the issue to ensure the pod is in the running state and the application is accessible.

## check logs and detail of container
`kubectl describe pod webserver`
`kubectl logs webserver`
## output current pod yaml
`kubectl get pod webserver -o yaml > webserver.yaml`
## fix image name
`kubectl delete pod webserver`
`kubectl apply -f webserver.yaml`