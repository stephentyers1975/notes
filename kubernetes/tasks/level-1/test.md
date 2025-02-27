# test
1. a. Create a pod named pod-nginx-t1q1 utilizing the nginx image, ensuring the use of the latest tag, denoted as nginx:latest (remember to mention tag name while defining the image).

b. Set the app label to nginx_app_t1q1, and name the container as nginx-container-t1q1.

This task aims to establish a new pod adhering to defined image specifications and container naming conventions.

```
apiVersion: v1
kind: Pod
metadata:
  labels:
    app: nginx_app_t1q1
  name: pod-nginx-t1q1
spec:
  containers:
  - image: nginx:latest
    name: nginx-container-t1q1
  restartPolicy: Always
```

2. We've successfully deployed a pod named httpd-app-t1q3. We require some data to be copied from the jump_host to this specific Pod. Further details are outlined below:

Copy file /home/thor/welcome.txt to pod httpd-app-t1q3 Pod under location /opt.

Note: The kubectl utility on jump_host has been configured to work with the kubernetes cluster.

`kubectl cp /home/thor/welcome.txt httpd-app-t1q3:/opt/`

3. The deployment name is green-app-t2q6 , change imagePullPolicy to Always so that it always try to pull the latest image.
`kubectl edit deployments.apps green-app-t2q6`

4. There is a deployment named web-app-t2q4, delete the same.
`kubectl delete deployments.apps web-app-t2q4`

5. Create a ReplicationController using nginx image, preferably with latest tag, and name it as nginx-replicationcontroller-t3q5. All pods should be running state after deployment.

```
apiVersion: v1
kind: ReplicationController
metadata:
  name: nginx-replicationcontroller-t3q5
spec:
  replicas: 3
  selector:
    app: nginx
  template:
    metadata:
      name: nginx
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:latest
        ports:
        - containerPort: 80
```

6. a. Create a ReplicaSet named nginx-replicaset-t3q4 using nginx image with latest tag only (remember to mention tag i.e nginx:latest).

b. Label app should be nginx_app_t3q4, label type should be front-end-t3q4.

c. The container should be named as nginx-container-t3q4, also make sure replicas counts are 4.

Note: The kubectl utility on jump_host has been configured to work with the kubernetes cluster.

```
apiVersion: apps/v1
kind: ReplicaSet
metadata:
  name: nginx-replicaset-t3q4
  labels:
    app: nginx_app_t3q4
    type: front-end-t3q4
spec:
  # modify replicas according to your case
  replicas: 4
  selector:
    matchLabels:
      app: nginx_app_t3q4
      type: front-end-t3q4
  template:
    metadata:
      labels:
        app: nginx_app_t3q4
        type: front-end-t3q4
    spec:
      containers:
      - name: nginx-container-t3q4
        image: nginx:latest
```

7. App deployment name is purple-app-deployment-t4q5. The service associated with the app is currently non-operational on nodePort 32232.

Your objective is to troubleshoot the service issue associated with the purple-app-deployment-t4q5. Ensure that the app becomes accessible and functional on nodePort 32232.

Please proceed with the necessary diagnostics and adjustments to resolve the service issue and access the app using Purple App button on the top.

* edited service and made it a NodePort type and set nodePort to 32232
`kubectl edit svc purple-app-service-t4q5`

8. The pod named nginx-phpfpm-t4q3 and the associated config map named nginx-config-t4q3 are experiencing issues following recent modifications. Your task is to diagnose the issue and restore functionality to the setup.

Once the issue is resolved, copy the /home/thor/index.php file from the jump-host to the nginx-container, placing it within the document root /var/www/html. Subsequently, ensure the website becomes accessible via the Website button located in the top bar.

Please proceed with troubleshooting the identified issues and implementing the necessary fixes. Afterward, complete the file transfer and verification of website accessibility. Also, feel free to re-create the pod if needed.

Fix incorrect nginx config path to document root in configmap and pod spec volumemounts. It should be 
/usr/share/nginx/html
```
- image: nginx:latest
    imagePullPolicy: Always
    name: nginx-container
    resources: {}
    terminationMessagePath: /dev/termination-log
    terminationMessagePolicy: File
    volumeMounts:
    - mountPath: /usr/share/nginx/html    #<- Edit to be this
      name: shared-files
```
## recreate pod
2. `kubectl replace --force -f pod.yaml`
## copy files into nginx-container
`kubectl cp -c nginx-container index.php nginx-phpfpm:/usr/share/nginx/html/index.php`

9. Update service-t5q5 service to an another match label component: front-end-t5q5.
* updated selector in service
```
selector:
    app: app-t5q5
    component: front-end-t5q5
```

10. The Nautilus DevOps team recently deployed an application on Kubernetes for testing purposes, the deployment name is httpd-deployment-t5q1. Initially, it was intended to test specific features. However, there's a current need to expose this application to test the frontend.

To achieve this, a service needs to be created. The service should be named httpd-service-t5q1 with a nodePort set to 30004.

```
apiVersion: v1
kind: Service
metadata:
  name: httpd-service-t5q1
spec:
  type: NodePort
  selector:
    app: app-t5q1
  ports:
    - port: 80
      targetPort: 80
      nodePort: 30004
```

