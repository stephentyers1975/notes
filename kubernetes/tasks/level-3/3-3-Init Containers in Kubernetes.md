# Init Containers in Kubernetes
There are some applications that need to be deployed on Kubernetes cluster and these apps have some pre-requisites where some configurations need to be changed before deploying the app container. Some of these changes cannot be made inside the images so the DevOps team has come up with a solution to use init containers to perform these tasks during deployment. Below is a sample scenario that the team is going to test first.

Create a Deployment named as ic-deploy-nautilus.

Configure spec as replicas should be 1, labels app should be ic-nautilus, template's metadata lables app should be the same ic-nautilus.

The initContainers should be named as ic-msg-nautilus, use image fedora, preferably with latest tag and use command '/bin/bash', '-c' and 'echo Init Done - Welcome to xFusionCorp Industries > /ic/official'. The volume mount should be named as ic-volume-nautilus and mount path should be /ic.

Main container should be named as ic-main-nautilus, use image fedora, preferably with latest tag and use command '/bin/bash', '-c' and 'while true; do cat /ic/official; sleep 5; done'. The volume mount should be named as ic-volume-nautilus and mount path should be /ic.

Volume to be named as ic-volume-nautilus and it should be an emptyDir type.
## create and deploy deployment template
```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: ic-deploy-nautilus
  labels:
    app: ic-nautilus
spec:
  replicas: 1
  selector:
    matchLabels:
      app: ic-nautilus
  template:
    metadata:
      labels:
        app: ic-nautilus
    spec:
      containers:
      - name: ic-main-nautilus
        image: fedora:latest
        command: ["/bin/bash", "-c", "while true; do cat /ic/official; sleep 5; done"]
        volumeMounts:
        - name: ic-volume-nautilus
          mountPath: /ic
      initContainers:
      - name: ic-msg-nautilus
        image: fedora:latest
        command: ["/bin/bash", "-c", "echo Init Done - Welcome to xFusionCorp Industries > /ic/official"]
        volumeMounts:
        - name: ic-volume-nautilus
          mountPath: /ic
      volumes:
        - name: ic-volume-nautilus
          emptyDir: {}
```
`kubectl apply -f ic-deploy-nautilus.yaml`
## test to see if init container functioned
`kubectl exec -it ic-deploy-nautilus-885bfcb87-xx74m -- cat /ic/official`