# lifecycle management
## view deployments
`helm list`
## view release history
`helm history nginx_release`
## rollback release
`helm rollback nginx-release 1`
## upgrade release
`helm upgrade dazzling-web bitnami/nginx --version 13`