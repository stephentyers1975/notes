# Chapter 11 Storage

## core objects

* PersistentVolumes (PV) 
* PersistentVolumeClaims (PVC) 
* StorageClasses (SC)

PVs map to external volumes, PVCs grant access to PVs, and SCs make it all automatic and dynamic.

## Working with storage classes

1. Install and configure the CSI plugin
2. Create one or more StorageClasses
3. Deploy Pods with PVCs that request volumes via the
StorageClasses

# Additional volume settings

StorageClasses give you lots of ways to control how volumes are provisioned and managed. We’ll cover the following:

* Access mode 
* Reclaim policy

## Access mode
Kubernetes supports three volume access modes:
 
* ReadWriteOnce (RWO)
* ReadWriteMany (RWM)
* ReadOnlyMany (ROM)

ReadWriteOnce lets a single PVC bind to a volume in read- write (R/W) mode. Attempts to bind it from multiple PVCs will fail.

ReadWriteMany lets multiple PVCs bind to a volume in read- write (R/W) mode. File and object storage usually support this mode, whereas block storage usually doesn’t.

ReadOnlyMany allows multiple PVCs to bind to a volume in read-only (R/O) mode.

ReclaimPolicies tell Kubernetes what to do with a PV and associated external storage when its PVC is released. Two policies currently exist:
* Delete - deletes the PV and associated external storage when the PVC is released
* Retain - keep the PV and external storage after you delete the PVC. 

* dynamically create pvc in statefulset spec etc.. with volumeClaimTemplates to enable persistent storage per pod
```
spec.volumeClaimTemplates

volumeClaimTemplates:
- metadata:
    name: webroot
  spec:
    accessModes: [ "ReadWriteOnce" ]
    storageClassName: "block"
    resources:
      requests:
        storage: 10Gi
```