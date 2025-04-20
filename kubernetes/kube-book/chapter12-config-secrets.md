# Chapter 12 config maps and secrets

* ConfigMap (CM) lets you store configuration data outside of Pods and inject it at run time.

* Once you’ve created a ConfigMap, you can use any of the following methods to inject it into containers at run time:
1. Environment variables
2. Arguments to the container’s startup command 
3. Files in a volume

* Kubernetes-native applications have the ability to read ConfigMaps directly through the API without having to mount them as volumes or via environment variables. It also means live containers can see updates to the ConfigMap. However, apps like these can only run on Kubernetes and create Kubernetes lock-in where your apps only work on Kubernetes.

## create a configmap
### from literal
`kubectl create cm testmap1 --from-literal shortname=SAFC --from-literal longname="Sunderland Association Football CLub"`
### from file

# Secrets
## create a generic secret
`kubectl create secret generic creds --from-literal user=nigelpoulton --from-literal pwd=Password123`

A typical secrets workflow that only uses Kubernetes Secrets looks like this:
1. You create the Secret which Kubernetes persists to the cluster store as an un-encrypted object
2. You schedule a Pod with a container that uses the Secret
3. Kubernetes transfers the un-encrypted Secret over the
network to the node running the Pod
4. The kubelet on the node starts the Pod and its containers
5. The container runtime mounts the Secret into the container
via an in-memory tmpfs filesystem and decodes it from
base64 to plain text
6. The application consumes it
7. When you delete the Pod, Kubernetes deletes the copy of the
Secret on the node (it keeps the copy in the cluster store)

## Recommended Actions

* Encryption of secrets while at rest in the cluster store 
* Encryption of secrets while in flight on the network 
* Protection of secrets when surfaced in nodes/Pods/containers 
* Controlling API access to secrets via least privilege RBAC 
* Controlling access to etcd nodes (cluster store)
* Preventing privileged containers from accessing secrets 
* Preventing exposure via source code repositories like GitHub 
* Securely deleting secrets when no longer in use
