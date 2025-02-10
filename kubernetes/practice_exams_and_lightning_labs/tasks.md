# Tasks

1. Upgrade the current version of kubernetes from 1.30.0 to 1.31.0 exactly using the kubeadm utility. Make sure that the upgrade is carried out one node at a time starting with the controlplane node. To minimize downtime, the deployment gold-nginx should be rescheduled on an alternate node before upgrading each node.

Upgrade controlplane node first and drain node node01 before upgrading it. Pods for gold-nginx should run on the controlplane node subsequently.

Follow kubernetes documentation

2. Print the names of all deployments in the admin2406 namespace in the following format:

DEPLOYMENT   CONTAINER_IMAGE   READY_REPLICAS   NAMESPACE

<deployment name>   <container image used>   <ready replica count>   <Namespace>
. The data should be sorted by the increasing order of the deployment name.

Example:

DEPLOYMENT   CONTAINER_IMAGE   READY_REPLICAS   NAMESPACE
deploy0   nginx:alpine   1   admin2406
Write the result to the file /opt/admin2406_data.

ANSWER: 
`kubectl get deployments.apps -n admin2406 -o=custom-columns=DEPLOYMENT:.metadata.name,CONTAINER_IMAGE:.spec.template.spec.containers[0].image,READY_REPLICAS:.status.readyReplicas,NAMESPACE:.metadata.namespace > /opt/admin2406_data`

3. A kubeconfig file called admin.kubeconfig has been created in /root/CKA. There is something wrong with the configuration. Troubleshoot and fix it.
ANSWER:
update port to kubeapi-server

4. Create a new deployment called nginx-deploy, with image nginx:1.16 and 1 replica.
Next, upgrade the deployment to version 1.17 using rolling update and add the annotation message
Updated nginx image to 1.17.
ANSWER:
`kubectl create deployment nginx --image=nginx:1.16.0 --replicas 1`
`kubectl rollout history deployment nginx`
`kubectl set image deployment nginx nginx=nginx:latest`
`kubectl annotate deployment nginx kubernetes.io/change-cause="version change to 1.16.0 to latest" --overwrite=true`

5. A new deployment called alpha-mysql has been deployed in the alpha namespace. However, the pods are not running. Troubleshoot and fix the issue. The deployment should make use of the persistent volume alpha-pv to be mounted at /var/lib/mysql and should use the environment variable MYSQL_ALLOW_EMPTY_PASSWORD=1 to make use of an empty root password.

Important: Do not alter the persistent volume.

created new pvc with correct name and storage class config and accessmode so it matches the PV

```
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: mysql-alpha-pvc
  namespace: alpha
spec:
  accessModes:
  - ReadWriteOnce
  resources:
    requests:
      storage: 1Gi
  storageClassName: slow
```

6. Take the backup of ETCD at the location /opt/etcd-backup.db on the controlplane node.
`etcdctl backup --data-dir=/var/lib/etcd --backup-dir /opt/etcd-backup.db`

7. Create a pod called secret-1401 in the admin1401 namespace using the busybox image. The container within the pod should be called secret-admin and should sleep for 4800 seconds.

The container should mount a read-only secret volume called secret-volume at the path /etc/secret-volume. The secret being mounted has already been created for you and is called dotfile-secret.

`kubectl run secret-1401 -n admin1401 --image=busybox --dry-run=client -o yaml --command -- sleep 4800 > admin.yaml`
```
---
apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  labels:
    run: secret-1401
  name: secret-1401
  namespace: admin1401
spec:
  containers:
  - command:
    - sleep
    - "4800"
    image: busybox
    name: secret-1401
    resources: {}
    volumeMounts:
    - name: secret-volume
      readOnly: true
      mountPath: "/etc/secret-volume"
  dnsPolicy: ClusterFirst
  restartPolicy: Always
  volumes:
  - name: secret-volume
    # secret volume
    secret:
      secretName: dotfile-secret
status: {}
```
