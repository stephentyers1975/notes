# Set Up Time Check Pod in Kubernetes
Create a pod called time-check in the datacenter namespace. The pod should contain a container named time-check, utilizing the busybox image with the latest tag (specify as busybox:latest).

Create a config map named time-config with the data TIME_FREQ=5 in the same namespace.

Configure the time-check container to execute the command: while true; do date; sleep $TIME_FREQ;done. Ensure the result is written /opt/security/time/time-check.log. Also, add an environmental variable TIME_FREQ in the container, fetching its value from the config map TIME_FREQ key.

Create a volume log-volume and mount it at /opt/security/time within the container.
## create namespace
`kubectl create namespace devops`
## config map

```
apiVersion: v1
kind: ConfigMap
metadata:
  name: time-config
  namespace: devops
data:
  TIME_FREQ: "7"
```
## pod yaml
```
apiVersion: v1
kind: Pod
metadata:
  labels:
    run: time-check
  name: time-check
  namespace: devops
spec:
  containers:
  - image: busybox:latest
    name: time-check
    env:
      - name: TIME_FREQ
        valueFrom:
          configMapKeyRef:
            name: time-config
            key: TIME_FREQ
    command:
      - /bin/sh
      - -c
      - "while true; do date >> /opt/itadmin/time/time-check.log; sleep $TIME_FREQ; done"
    volumeMounts:
    - name: log-volume
      mountPath: /opt/itadmin/time
  volumes:
  - name: log-volume
    hostPath:
      path: /tmp/log-volume
      type: DirectoryOrCreate
```