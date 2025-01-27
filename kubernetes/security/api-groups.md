# API groups
* core group /api/v1

!["core api"](/images/coreapi.png)

* named group /apis
* newer features

!["core api2"](/images/coreapi2.png)

# list available api groups
```
curl http://localhost:6443 -k /
    --key admin.key
    --cert admin.crt
    --cacert ca.crt
```
# list available named api groups
```
curl http://localhost:6443/apis -k
    --key admin.key
    --cert admin.crt
    --cacert ca.crt 
```

## list using kubectl proxy to avoid manually entering certificates
`kubectl proxy`
`curl http://localhost:8001 -k`