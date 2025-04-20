# chapter 16: Threat modeling Kubernetes

# STRIDE Model

* Spoofing
* Tampering 
* Repudiation 
* Information disclosure 
* Denial of service 
* Elevation of privilege

## Spoofing
Securing communications with the API server

all internal and external requests to the API server are subject to authentication and authorization checks. As a result, the API server needs a way to authenticate (trust) internal and external sources. A good way to do this is to have two trusted key pairs:

* One for authenticating internal systems
* A second for authenticating external systems

Modern Kubernetes clusters implement two technologies to help enforce Pod security settings:
* Pod Security Standards (PSS) are policies that specify required Pod security settings
* Pod Security Admission (PSA) enforces one or more PSS policies when Pods are created

Pod Security Admission (PSA)

Pod Security Admission (PSA) enforces your desired PSS policies. It works at the Namespace level and is implemented as a validating admission controller.
PSA offers three enforcement modes:
Warn : Allows violating Pods to be created but issues a user- facing warning
Audit : Allows violating Pods to be created but logs an audit event
Enforce : Rejects Pods if they violate the policy