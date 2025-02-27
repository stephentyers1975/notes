# Create Countdown Job in Kubernetes
Create a job named countdown-devops.
The spec template should be named countdown-devops (under metadata), and the container should be named container-countdown-devops
Utilize image fedora with latest tag (ensure to specify as fedora:latest), and set the restart policy to Never.
Execute the command sleep 5
## create job.yaml
```
apiVersion: batch/v1
kind: Job
metadata:
  name: countdown-devops
spec:
  template:
    metadata:
      name: countdown-devops
    spec:
      containers:
      - name: container-countdown-devops
        image: fedora:latest
        command: ["sleep",  "5"]
      restartPolicy: Never
```
## apply template
`kubeclt create -f job.yaml`