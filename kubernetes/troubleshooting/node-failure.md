# troubleshoot control plane
* check node status
* check pods
* check kube-system pods
* or check control-plane services
  * systemctl status kube-apiserve
  * systemctl status kube-controller-manager
  * systemctl status kube-scheduler
* check worker node services
  * systemctl status kubelet
  * systemctl status kube-proxy
* check control plane logs (kubeadm install) using kubectl logs kube-apiserver-master
* or check control plane service logs (non-kubeadm install) with sudo journalctl -u kube-apiserver

# troubleshoot worker node
* check node status
* check pods
* kubectl describe node worker-1
* check condition pressure flags for things like memory/disk
* check lastheartbeat field for crash time
* use linux cmds like "top" and "df -h" for process, memory or disk issues
* check kubelet service/status
* check kubelet logs on system pod or service via "journalctl -u kubelet"
* check kubelet certs expiration date with "openssl x509 -in /var/lib/kubelet/worker-1.crt -text"
* check kublet config in /etc/kubernetes/
* check port config