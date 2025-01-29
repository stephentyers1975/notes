# Image security

```
kubectl create secret docker-registry regcred \
    --docker-server= private-registry.io \
    --docker-username= registry-user \
    --docker-password=  registry-password\
    --docker-email=  registry-user@org.com\
```

```
apiVersion: v1
kind: Pod
metadata:
  name: nginx-pod
spec:
  containers:
  - name: nginx
    image: private-registry.io/apps/internal-app
  imagePullSecrets:
  - name: regcred
```
