# static pods

* kubelet can manage node independantly with the local container runtime if no cluster or api-server exists 
* kubelet can only create pods on it's own called static pods
* kubelet can be configured to read pod yaml definitions from manifest directory - /etc/kubernetes/manifests
* manifest directory can be anywhere and is configured either in the kubelet.service file 
  * kubelet.service
  * check process -> ps aux | grep kubelet
  * /var/lib/kubelet/config.yaml -> static pod path
  * --pod-manifest-path=/etc/kubernetes/manifests
* Or in a yaml file referenced in kubelet.service file 
  * --config=kubeconfig.yaml
  * set in kubeconfig.yaml -> staticPodPath: /etc/kubernetes/manifests
  * kubeadm setups use this method
* static pods can be viewed with respective container runtime commands
  * docker ps -> docker
  * crictl ps -> cri-o
  * nerdctl ps -> containerd
* kubectl and cluster can view static pods as a read-only mirror is created in kube-apiserver from the kubelet local manifests
* use case -> deploy control plane components as static pods
  * install kubelet on each node
  * create pod definition files for control plane components

# deploy a static pod example - kubelet automatically picks up file and creates pod with container runtime
`kubectl run static-busybox --image busybox --command sleep 1000 --dry-run=client -o yaml > /etc/kubernetes/manifests/static-def.yaml`