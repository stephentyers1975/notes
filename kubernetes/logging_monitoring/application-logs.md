# Application logs

## view live logs on pod in follow mode. If pod has multiple containers you must specify container name explicitly
`kubectl logs -f pod_name`
### select container in multi-container pod
``kubectl logs -f container_1 pod_name``