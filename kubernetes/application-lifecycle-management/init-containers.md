# init containers

* used to run processes to completion that are required before main container in pod is started - > checking for DB or external service to be up
* When a POD is first created the initContainer is run, and the process in the initContainer must run to a completion before the real container hosting the application starts.
* multiple init containers can be configured
* if any init container fails, the pod will be restarted until successfful
* labelled in YAML as -> initContainers

## Example YAML

```
apiVersion: v1
kind: Pod
metadata:
  name: myapp-pod
  labels:
    app: myapp
spec:
  containers:
  - name: myapp-container
    image: busybox:1.28
    command: ['sh', '-c', 'echo The app is running! && sleep 3600']
  initContainers:
  - name: init-myservice
    image: busybox
    command: ['sh', '-c', 'git clone  ;']
```

```
apiVersion: v1 
kind: Pod 
metadata: 
  name: myapp-pod 
  labels: 
    app: myapp 
spec: 
  containers:
  - name: myapp-container 
    image: busybox:1.28 
    command: ['sh', '-c', 'echo The app is running! && sleep 3600'] 
  initContainers:
  - name: init-myservice 
    image: busybox:1.28 
    command: ['sh', '-c', 'until nslookup myservice; do echo waiting for myservice; sleep 2; done;']
  - name: init-mydb 
    image: busybox:1.28 
    command: ['sh', '-c', 'until nslookup mydb; do echo waiting for mydb; sleep 2; done;']
```