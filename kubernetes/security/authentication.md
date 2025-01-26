# Authentication
* kube-apiserver
  * static password file
  * static token file
  * certificates
  * identity services (LDAP/KEBEROS)

## static password file
* static list of users and passwords in CSV  -> 3 columns (password, username, userid and optionally group)
* pass CSV as option 
    * non-kubeadm method -> --basic-auth-file=user_details.csv in kube-apiserver.service unit file
    * kubeadm method -> edit /etc/kubernetes/manifests/kube-apiserver.yaml add --basic-auth-file=user_details.csv under command: array

!["authentication static"](/images/auth1.png)

## Authenticate static user
`curl -v -k https://master-node-ip:6443/api/vi/pods -u "user1:password123"`

* token instead of password can be specified
* --token-auth-file=user_token_details.csv in service file(non-kubeadm) or yaml manifest of kube-apiserver pod(kubeadm)

## Authenticate token user
`curl -v -k https://master-node-ip:6443/api/vi/pods --header  "Authorization Bearer KSDFKDKFSKAFKASDKFAKFKDSA3fs"`

* This is not a recommended approach for authentication
* Conside volume mount while providing the auth file in a kubeadm setup
* setup role based authorization for the new users
