# Storage Classes

## static provisioning
* provision disk on cloud provider
`gcloud beta compute disk create --size 1gb --region us-east1 pd-disk`
* create persistent volume definition to manually point to new cloud disk
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
  gcePersistentDisk:
    pdName: pd-disk
    fdType: ext4
```
## classes
* Dynamic provisioning
* create provisioner class yaml
* no longer need persistent volume configuration it is created automatically via the storage class
* persistent volume claim links directly via storageClassName key in yaml to storage class provisioner

## storage class provisioner yaml
```
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: google-storage
provisioner: kubernetes.io/gce-pd
```

## link to persistent volume claim to storage class
```
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: myclaim
spec:
  accessModes:
    - ReadWriteOnce
  storageClassName: google-storage
  resources:
    requests:
      storage: 500Mi
```