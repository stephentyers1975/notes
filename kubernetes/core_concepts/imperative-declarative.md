# imperative / declarative

## imperative examples
`kubectl run nginx --image=nginx`
`kubectl create deployment --image=nginx nginx`
`kubectl expose deployment nginx --port 80`
`kubectl edit deployment nginx`
`kubectl scale deployment nginx --replicas=5`
`kubectl set image deployment nginx nginx=nginx:1.18`
`kubectl create -f nginx.yaml`
`kubectl replace -f nginx.yaml`
`kubectl deletee -f nginx.yaml`

## declarative example - creates or updates if exists
`kubectl apply -f nginx.yaml`
`kubectl apply -f /path/to/confif-files`

* store manifest in repo
* changes made via kubectl edit command are not reflected in original manifest file
* Best practice is to edit original manifest and run kubectl replace command

## Imperative approach

!["imperative approach](/images/imperative.png)




## Declarative approach

!["declarative approach](/images/declarative.png)

!["declarative approach](/images/declarative2.png)

!["declarative approach](/images/declarative3.png)


