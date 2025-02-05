# Admission Controllers
* provides deeper level controls to resources than just api authorization
* examples
  * AlwaysPullImages
  * DefaultStorageClass
  * EventRateLimit
  * NamespaceAutoProvision
  * NameSpaceExists
  * Many more..
  * Note that the NamespaceExists and NamespaceAutoProvision admission controllers are deprecated and now replaced by NamespaceLifecycle admission controller.

!["admission_controllers"](/images/admission_controllers.png)

# view enabled admission controllers - non kubeadmin setup
`kube-apiserver -h | grep enable-admission-plugins`
# view enabled admission controllers - kubeadmin setup run within kube-api pod
`kubectl exec kube-apiserver-pod -n kube-system -- kube-apiserver -h | grep enable-admission-plugins`
## or inspect pod manifest settings
`vim /etc/kubernetes/manifests/kube-apiserver.yaml`
## or use ps and grep to look at the process running on the control plane
`ps -ef | grep kube-apiserver | grep admission-plugins`

# Enable various admission controllers - update --enable-admission-plugins= flag
## non kubeadmin install method - service unit file
`kube-apiserver.service`
`--enable-admission-plugins=NodeRestriction,NamespaceAutoProvision....`
## kubeadmin install method - kube-apiserver.yaml manifest
`kube-apiserver.yaml`
`--enable-admission-plugins=NodeRestriction,NamespaceAutoProvision....`
## disable admission controller plugin
`--disable-admission-plugins`

## Mutating admission controllers
* can change the request
* ususally invoked before validating admission controller
* example NamespaceAutoProvision controller
## validating admission controllers
* can validate the request and allow/deny it
* example NamesapceExists controller

## create external admission controllers
* MutatingAdmissionWebhook
* ValidatingAdmissionWebhook

# 1. Deploy Webhook Server
* any api server - like go, python
* contains logic to permit or reject request
* Contains correct logic to respond to webhook
* host it as deployment/service in Kubernetes or host it externally

# 2. Configuring admission webhook
```
apiVersion: admissionregistration.k8s.io/v1
kind: ValidatingWebhookConfiguration
metadata:
  name: "pod-policy.example.com"
webhooks:
- name: "pod-policy.example.com"
  rules:
  - apiGroups:   [""]
    apiVersions: ["v1"]
    operations:  ["CREATE"]
    resources:   ["pods"]
    scope:       "Namespaced"
  clientConfig:
    service:
      namespace: "webhook-namespace"
      name: "webhook-service"
    caBundle: <CA_BUNDLE>
  admissionReviewVersions: ["v1"]
  sideEffects: None
  timeoutSeconds: 5
```
