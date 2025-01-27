# TLS in Kubernetes

* server certificate
* root certificate on CA
* Client certificate

# naming conventions for certificates and keys (usually)
* Certificate (Public Key) -> *.crt *.pem
* Private Key -> *.key *-key.pem
* optionally separate CA for server/client components and ETCD server

!["servertls"](/images/servertls.png)

!["clienttls"](/images/clienttls.png)

!["alltls"](/images/alltls.png)

!["alltls2"](/images/alltls2.png)

!["alltls3"](/images/alltls3.png)

# Generate certificates
* use either EASYRSA OPENSSL CFSSL

# openssl -> generate Certificate Authority (CA) certificate
## generate private key
`openssl genrsa -out ca.key 2048`
## generate certificate signing request (CSR) using private key generated earlier
`openssl req -new -key ca.key -subj "/CN=KUBERNETES-CA" -out ca.csr`
## sign certificate (self-signed) using the CSR generated in previous command
`openssl x509 -req -in ca.csr -signkey ca.key -out ca.crt`

# Client certificates
* Admin 
## generate private key
`openssl genrsa -out admin.key 2048`
## generate certificate signing request (CSR) using private key generated earlier
`openssl req -new -key admin.key -subj "/CN=kube-admin-CA/O=system:masters" -out admin.csr`
## sign certificate with CA key/cert using the CSR generated in previous command
`openssl x509 -req -in admin.csr -CA ca.crt -CAkey ca.key -out admin.crt`

* generate all other client certificates for services in the above manner
* replace relevant details
  * system:kube-scheduler
  * system:kube-controller-manager
  * system:kube-proxy

* admin.crt and admin.key can be used in used call to admin service or in kube-config.yaml file for clients like kubectl

# Server certificates
* generate in the same manner above
* etcd-server
    * create additional peer certs for each node in etcd cluster etcd-peer etcdpeer1, etcdpeer2 etc..
* kube-apiserver
  * follow usual openssl procedure when creating certificates
  * include all alternative names in a .cnf file when running openssl command
  `openssl req -new -key apiserver.key -subj "/CN=kube-apiserver" -out apiserver.csr -config openssl.cnf`
* kubelet server
  * key/certificate pair for each node
  * name after nodes node01 etc..
  * system:node:node01
  * group system:nodes

# view certificates in existing cluster
* kubeadm -> /etc/kubernetes/manifests/kube-apiserver.yaml
`openssl x509 -in /etc/kubernetes/pki/apiserver.crt -text -noout`
* manual service method - check service unit files
* inspect logs
  * kubedamin via kubectl logs cmd or if this doesn't work use container runtime commands like crictl or docker
  * manual service method via journalctl command