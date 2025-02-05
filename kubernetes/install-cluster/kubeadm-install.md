# Kubeadm install

## steps
1. provision vm nodes
2. Install container runtime on nodes
3. install kubeadm
4. Initialise Master node
5. Install pod network across nodes
6. Join worker nodes to cluster

!["install steps"](/images/install-steps.png)

## Vagrant file link
`https://github.com/kodekloudhub/certified-kubernetes-administrator-course`
## kubeadm install documentation
`https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/`

# prereqs
## enable ip forwarding - edit file with "│net.ipv4.ip_forward=1"
`/etc/sysctl.conf`
## apply changes
`sysctl -p`
# manually enable br_netfilter kernel module on ubuntu
`modprobe br_netfilter`
# add br_netfilter to kernel modules conf
`/etc/modules`
# regenerate cluster join command
`kubeadm token create --print-join-command`