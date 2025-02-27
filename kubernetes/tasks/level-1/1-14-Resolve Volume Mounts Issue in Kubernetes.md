# Resolve Volume Mounts Issue in Kubernetes
We encountered an issue with our Nginx and PHP-FPM setup on the Kubernetes cluster this morning, which halted its functionality. Investigate and rectify the issue:

The pod name is nginx-phpfpm and configmap name is nginx-config. Identify and fix the problem.

Once resolved, copy /home/thor/index.php file from the jump host to the nginx-container within the nginx document root. After this, you should be able to access the website using Website button on the top bar.

1. Fix incorrect nginx config path to document root in configmap and pod spec volumemounts. It should be 
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