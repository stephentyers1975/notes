# Schedule Cronjobs in Kubernetes
Create a cronjob named nautilus.
Set Its schedule to something like */3 * * * *. You can set any schedule for now.
Name the container cron-nautilus.
Utilize the nginx image with latest tag (specify as nginx:latest).
Execute the dummy command echo Welcome to xfusioncorp!.
Ensure the restart policy is OnFailure.
## create cronjob yaml file
```
apiVersion: batch/v1
kind: CronJob
metadata:
  name: nautilus
spec:
  schedule: "*/3 * * * *"
  jobTemplate:
    spec:
      template:
        spec:
          containers:
          - name: cron-nautilus
            image: nginx:latest
            imagePullPolicy: IfNotPresent
            command:
            - /bin/sh
            - -c
            - echo Welcome to xfusioncorp!
          restartPolicy: OnFailure
```
## apply yaml file
`kubectl apply -f cronjob.yaml`