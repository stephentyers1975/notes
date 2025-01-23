# Environment Variables
* set ENV array property 

## ENV value types

### plain key value
env:
  - name: APP_COLOR
    value: pink

### ConfigMap
env:
  - name: APP_COLOR
    valueFrom: 
        configMapKeyRef:

### Secrets
env:
  - name: APP_COLOR
    valueFrom: 
        secretKeyRef:

```
apiVersion: v1
kind: Pod 
metadata:
  name: ubuntu-sleeper-3
spec:
  containers:
  - name: ubuntu
    image: ubuntu
    command:
      - "sleep"
      - "1200"
```