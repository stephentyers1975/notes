# components
## yaml
```
apiVersion: kustomize.config.k8s.io/v1alpha1
kind: Component

resources:
  - postgres-depl.yaml

secretGenerator:
  - name: postgres-cred
    literals:
      - password=postgres123
patches:
  - deployment-patch.yaml
```
## import component
```
components:
  - ../../components/db
```