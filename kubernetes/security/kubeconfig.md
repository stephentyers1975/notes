# Kubeconfig security

* config file consists of clusters, contexts and users
!["kubeconfig diagram"](/images/kubeconfig-diagram.png)
* stored in ~/.kube/config

## view kube config file
`kubectl config view`
## view kube config using custom config file
`kubectl config view --kubeconfig=my-custom-config`
## change from default context
`kubectl config use-context prod-user@production`
## check current context
`kubectl config current-context`
## set config file with environment variable. You could add to .bashrc file
`export KUBECONFIG=/root/my-kube-config`

* config file contexts can be configured to switch to a default namespace in the yaml file

!["kubeconfig diagram 2"](/images/kubeconfig-diagram2.png)

* certificates can be referenced by file path with certificate-authority:
* or by the actual certificate date encoded in base64 using certificate-authority-data: