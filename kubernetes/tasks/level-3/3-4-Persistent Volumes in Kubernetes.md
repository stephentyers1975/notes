# Persistent Volumes in Kubernetes
The Nautilus DevOps team is working on a Kubernetes template to deploy a web application on the cluster. There are some requirements to create/use persistent volumes to store the application code, and the template needs to be designed accordingly. Please find more details below:

Create a PersistentVolume named as pv-xfusion. Configure the spec as storage class should be manual, set capacity to 5Gi, set access mode to ReadWriteOnce, volume type should be hostPath and set path to /mnt/dba (this directory is already created, you might not be able to access it directly, so you need not to worry about it).

Create a PersistentVolumeClaim named as pvc-xfusion. Configure the spec as storage class should be manual, request 1Gi of the storage, set access mode to ReadWriteOnce.

Create a pod named as pod-xfusion, mount the persistent volume you created with claim name pvc-xfusion at document root of the web server, the container within the pod should be named as container-xfusion using image httpd with latest tag only (remember to mention the tag i.e httpd:latest).

Create a node port type service named web-xfusion using node port 30008 to expose the web server running within the pod.

## create persistent volume
```
apiVersion: v1
kind: PersistentVolume
metadata:
  name: pv-xfusion
spec:
  storageClassName: manual
  capacity:
    storage: 5Gi
  accessModes:
    - ReadWriteOnce
  hostPath:
    path: /mnt/dba
```
## create persistent volume claim
```
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: pvc-xfusion
spec:
  storageClassName: manual
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 1Gi
```
## create pod
```
apiVersion: v1
kind: Pod
metadata:
  name: pod-xfusion
  labels:
    app: httpd
spec:
  containers:
  - name: container-xfusion
    image: httpd:latest
    volumeMounts:
    - name: storage
      mountPath: /usr/local/apache2/htdocs/
    ports:
    - containerPort: 80
  volumes:
  - name: storage
    persistentVolumeClaim:
      claimName: pvc-xfusion
```
## create service
```
apiVersion: v1
kind: Service
metadata:
  name: web-xfusion
spec:
  type: NodePort
  selector:
    app: httpd
  ports:
  - protocol: TCP
    port: 80
    targetPort: 80
    nodePort: 30008
```