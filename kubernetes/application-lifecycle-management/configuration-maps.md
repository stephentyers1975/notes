# Configuration map

* ConfigMap injects environment variables into pod config
* 2 steps

# 1. create ConfigMap

## imperative method
```
kubectl create configmap \
  <config-name> --from-literal=<key>=<value>

```
```
kubectl create configmap \
  app-config --from-literal=APP_COLOR=blu \
             --from-literal=APP_MOD=prod

```
### from file
```
kubectl create configmap \
  <config-name> --from-file=<path-to-file>

```
```
kubectl create configmap \
  <config-name> --from-file=app_config.properties

```

## declarative method
`config-map.yaml`
```
apiVersion: v1
kind: ConfigMap
metadata:
  name: app-config
data:
  APP_COLOR: blue
  APP_MODE: prod
```

`kubectl create -f config-map.yaml`

## view config map
`kubectl get configmap`
## view detail of configmap
`kubectl describe configmaps`

# 2. Inject into POD

* use property envFrom in pod-definition.yaml

```
apiVersion: v1
kind: Pod 
metadata:
  name: simple-webapp-color
  labels:
    namee: simple-webapp-color
spec:
  containers:
  - name: simple-webapp-color
    image: simple-webapp-color
    ports:
      - containerPort: 8080
    envFrom:
      - configMapRef:
            name: app-config
```

# other ways to inject config into pods
* SINGLE ENV under configMapRef
```
envFrom:
      - configMapRef:
            name: app-config
            key: APP_COLOR
```
* volume method
```
volumes:
- name: app-config-volume
  configMap:
    name: app-config
```
## pull single ENV variable value into pod from configmap
```
apiVersion: v1
kind: Pod
metadata:
  labels:
    name: webapp-color
  name: webapp-color
  namespace: default
spec:
  containers:
  - env:
    - name: APP_COLOR
      valueFrom:
       configMapKeyRef:
         name: webapp-config-map
         key: APP_COLOR
    image: kodekloud/webapp-color
    name: webapp-color
```