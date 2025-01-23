# Services
* NodePort -> listens to port on the cluster node and forwards requests to pods
* ClusterIP -> creates VIP inside cluster to enable connectivity between different services i.e. frontend to backend
* LoadBalancer -> Provisions loadbalancer in supported cloud providers

## NodePort

!["nodeport](/images/nodeport.png)

* port -> port number on service
* ip -> ip address on service
* TargetPort port number on pod
* NodePort - > port number on cluster node

### definition file

!["nodeport](/images/nodeport2.png)

## create service from definition file
`kubectl create -f service-definition.yaml`
## display services
`kubectl get services`
## view url on minikube
`minikube service service_name --url`

```
---
apiVersion: v1
kind: Service
metadata:
  name: webapp-service
  namespace: default
spec:
  type: NodePort
  ports:
  - nodePort: 30080
    port: 8080
    targetPort: 8080
  selector:
    name: simple-webapp
```


## ClusterIP
### definition example file
```
apiVersion: v1
kind: Service
metadata:
  name: back-end
spec:
  type: ClusterIP
  ports:
    - targetPort: 80
      port: 80

  selector:
    app: myapp
    type: back-end
```

# Load Balancer -> integrates with major cloud providers. When run locally it will behave as it's a NodePort
apiVersion: v1
kind: Service
metadata:
  name: back-end
spec:
  type: LoadBalancer
  ports:
    - targetPort: 80
      port: 80
      nodePort: 30008

  selector:
    app: myapp
    type: back-end
```
