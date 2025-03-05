# Kubernetes Shared Volumes
Create a pod named volume-share-devops.

For the first container, use image debian with latest tag only and remember to mention the tag i.e debian:latest, container should be named as volume-container-devops-1, and run a sleep command for it so that it remains in running state. Volume volume-share should be mounted at path /tmp/official.

For the second container, use image debian with the latest tag only and remember to mention the tag i.e debian:latest, container should be named as volume-container-devops-2, and again run a sleep command for it so that it remains in running state. Volume volume-share should be mounted at path /tmp/demo.

Volume name should be volume-share of type emptyDir.

After creating the pod, exec into the first container i.e volume-container-devops-1, and just for testing create a file official.txt with any content under the mounted path of first container i.e /tmp/official.

The file official.txt should be present under the mounted path /tmp/demo on the second container volume-container-devops-2 as well, since they are using a shared volume.

## create pod yaml
```
apiVersion: v1
kind: Pod
metadata:
  name: volume-share-devops
spec:
    containers:
    - name: volume-container-devops-1
        image: debian:latest
        command: ["sleep", "infinity"]
        volumeMounts:
        - name: volume-share
          mountPath: /tmp/official
    - name: volume-container-devops-2
        image: debian:latest
        command: ["sleep", "infinity"]
        volumeMounts:
        - name: volume-share
          mountPath: /tmp/demo
    volumes:
      - name: volume-share
          emptyDir:
          sizeLimit: 500Mi
```
## apply yaml
`kubectl apply -f pod.yaml`
## run tests
`kubectl exec -it volume-share-devops -c volume-container-devops-1 -- bash`
* create file in official.txt in /tmp/official
`kubectl exec -it volume-share-devops -c volume-container-devops-1 -- bash`
* check official.txt is present in /tmp/demo