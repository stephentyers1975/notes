# Secrets
* 2 steps
* secrets are encoded not encrypted
* secrets in ETCD are not encrypted
  * enable encryption at rest
* anyone able to create pods/deployments in the same namespace can access the secrets
  * configure least-privilege RBAC access to secrets
* Consider third-party secrets store providers
  * AWS Provider, Azure provider, GCP provider, vaultprovider

# 1. create secret
## imperative
### from literal
```
kubectl create secret generic \
  <secret-name> --from-literal=<key>=<value>

kubectl create secret generic \
  app-secrert --from-literal=DB_HOST=mysql \
              --from-literal=DB_USER=root  \
              --from-literal=DB_PASSWORD=paswrd
```
### from a file
```
kubectl create secret generic \
  <secret-name> --from-file=<path-to-file>
```
```
kubectl create secret generic \
  <secret-name> --from-file=app_secret.properties
```
## Declarative

## create yaml file
```
apiVersion: v1
kind: Secret
metadata:
  name: app-secret
data:
  DB_HOST: mysql
  DB_User: root
  DB_Password: passwd
```
### encode plain text of secret to encoded form in above yaml file
`echo - 'mysql' | base64`
`echo - 'root' | base64`
`echo - 'passwd' | base64`
## create secret
`kubectl create -f secre-data.yaml`
## view secrets
`kubectl get secrets`
## view more detail on secrets - shows only keys not value
`kubectl describe secrets`
## view more detail on secrets - with values
`kubectl describe secrets app-secret -o yaml`
### decode secret to decoded form in above yaml file
`echo - 'mysql' | base64 --decode`
`echo - 'root' | base64 --decode`
`echo - 'passwd' | base64 --decode`

# 2. insert into pod

* add envFrom into YAM:
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
      - secretRef:
            name: app-secret
```
## multiple ways to inject secrets into pods
### all ENV's from secret
```
envFrom:
      - secretRef:
            name: app-secret
```
### single ENV from secret
```
envFrom:
      - secretRef:
            name: app-secret
            key: DB_password
```
### volume - each secret is created as a separate file with the value inside 
* DB_Host
* DB_Password
* DB_User
```
volumes:
- name: app-secret-volume
  secret:
    secretNAme: app-sec
```