# Certificates API
* service for signing new admin certificate request
* controller-manager carries this out
  * contains configuration for the signing key

## step 1 -> user creates key and CSR
`openssl genrsa -out jane.key 2048`
`openssl req -new -key jane.key -subj "/CN=jane" -out jane.csr`
## step 2 -> admin creates csr.yaml file with base64 encoded key using base64 -w 0
```
---
apiVersion: certificates.k8s.io/v1
kind: CertificateSigningRequest
metadata:
  name: akshay
spec:
  groups:
  - system:authenticated
  request: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURSBSRVFVRVNULS0tLS0KTUlJQ1ZqQ0NBVDRDQVFBd0VURVBNQTBHQTFVRUF3d0dZV3R6YUdGNU1JSUJJakFOQmdrcWhraUc5dzBCQVFFRgpBQU9DQVE4QU1JSUJDZ0tDQVFFQXdTSUJ1UDFuWkwxZy9DaXgvQjVjOXhnOU5kN1JROGYrS1lzMml5M0JOSmJ6CmVsWHh6Q2ZRSXVaYTNkOWpKTjNtUlEyK0NmOFlScm9FVTE3RUJvdUlnb0w5VWdFSnNkaXJ3ZC9sZzdUT2FqK0IKSDZiOVRoLzY1bmMzTUlkRkdWR1BaS0QzV3FtdS9VYlJNaWg1bVhNU1pLclAvQlRJdmtFQ2Q0MUVhR3VBQVBKLwpSWkVTL3hheDRTbXFRMkh5RWVQSTVmS0ZFTEVpejA4V1gvU3hTajJvd3pmbVRhZTlWb2Q5aHAxMkJNQ1JIMzE0CnkrNERBVUo5R3lDb0dQdnVHcHNlQndEak5QRnRjLzg5M2d6anp3bCsvcVJCaEFJSjduQVNadWUvdVpqcmVmNlgKaFU4ZDNUTzVOeEp1djBmRityMTBTbnpzWVh1OFlidGlsSjd5ZXcweXJRSURBUUFCb0FBd0RRWUpLb1pJaHZjTgpBUUVMQlFBRGdnRUJBQloyZHg4TW5obkRzSmd3UmJIREpFVTN4bDAzcUxWcGQyWm1VN0F0WDRDdnRKRTdyYTd2CjBMVmtwdHZ3eGtGVVRYblJPbEt1aGVJejRjMDV2dU5WdUI5L3p6V015L3RtS0FyYnFhQUpCZG1TWm15T1duSk0KMnQwdWpiaGJYK2pSUEZENDZEcC9sN01teWVoUXR2TUJ4WlFVd3dlTDhaTE13MXBINjdUN1VuM1kySFF2NzRYWQpJUlB3aElUY28vems1VnNaSnBsVzArSEZzT3huTDVGUjk0VjN4OGdKMVVDdjZsTDl5RjFiRStQTjl4d05RdThwCkFUSTI0eWJsS1JvTlFiSDd5TWF0UU5zbm9Zd2hnNUsyNHk5ZHNQeE14V2xHeFcyb1B2N1piYXpCWXU1RDVwVGQKbVFlMll6L3g3K2RBckU5VFp5QjFXc1krdXRaNUdSWTFsK3M9Ci0tLS0tRU5EIENFUlRJRklDQVRFIFJFUVVFU1QtLS0tLQo=
  signerName: kubernetes.io/kube-apiserver-client
  usages:
  - client auth
```
!["csr request"](/images/csrapi.png)
## step 3 -> admin approves request
## view requests
`kubectl get csr`
## approve requests
`kubectl certificate approve jane`
## deny requests
`kubectl certificate deny jane`
## view certificate contained in YAML file
`kubectl get csr jane -o yaml`
## delete csr
`kubectl delete csr agent-smith`
## decode certificate from base65
`echo ";sakf;safk" | base64 --decode`

