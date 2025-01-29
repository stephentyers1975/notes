# Volumes
* attached to pod

# volumes and mounts
```
apiVersion: v1
kind: Pod
metadata:
  name: random-number-generator
spec:
  containers:
    - name: alpine
      image: alpine
      command: ["/bin/sh", "-o"]
      args: ["shuf -i 0-100 -n 1 >> /opt/number.out"]
      volumeMounts:
      - mountPath: /opt
        name: data-volume

  volumes:
  - name: data-volume
    hostPath:
      path: /data
      type: Directory
```
* use external replicate cluster storage for multiple pods accessing the same data

# Persistent Volumes - shared cluster storage

* cluster wide pool of volumes
* can be carved out for individual apps with volume claims

## local example
```
apiVersion: v1
kind: PersistentVolume
metadata:
  name: pv-vol1
spec:
  accessModes:
    - ReadWriteOnce
  capacity:
    storage: 1Gi
  hostPath:
    path: /tmp/data
```
## AWS example
```
apiVersion: v1
kind: PersistentVolume
metadata:
  name: pv-vol1
spec:
  accessModes:
    - ReadWriteOnce
  capacity:
    storage: 1Gi
  awsElasticBlockStore:
    volumeID: <volume-id>
    fdType: ext4
```
## create persistent volume
`kubectl create -f pv-definition.yaml`
## view persistent volume
`kubectl get persistentvolume`

# Persistent Volumes Claims - makes available to node

## create persistent volume claim
```
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: myclaim
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 500Mi
```
## create persistent volume claim
`kubectl create -f pvc-definition.yaml`
## view persistent volume claim
`kubectl get persistentvolumeclaim`
## delete persistent volume claim
`kubectl delete persistentvolumeclaim myclaim`

* volume can be set as below in claim yaml to be persisted or not after claim deletion
* persistentVolumeReclaimPolicy: Retain
* persistentVolumeReclaimPolicy: Delete
* persistentVolumeReclaimPolicy: Recycle

## attach claim to pod /replicasets/deployment yaml

```
apiVersion: v1
kind: Pod
metadata:
 name: mypod
spec:
 containers:
  - name: myfrontend
    image: nginx
    volumeMounts:
    - mountPath: "/var/www/html"
      name: mypd
  volumes:
  - name: mypd
    persistentVolumeClaim:
      claimName: myclaim
```