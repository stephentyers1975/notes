# Print Environment Variables
The Nautilus DevOps team is working on to setup some pre-requisites for an application that will send the greetings to different users. There is a sample deployment, that needs to be tested. Below is a scenario which needs to be configured on Kubernetes cluster. Please find below more details about it.

Create a pod named print-envars-greeting.

Configure spec as, the container name should be print-env-container and use bash image.

Create three environment variables:

a. GREETING and its value should be Welcome to

b. COMPANY and its value should be DevOps

c. GROUP and its value should be Datacenter

Use command ["/bin/sh", "-c", 'echo "$(GREETING) $(COMPANY) $(GROUP)"'] (please use this exact command), also set its restartPolicy policy to Never to avoid crash loop back.

You can check the output using kubectl logs -f print-envars-greeting command.
```
apiVersion: v1
kind: Pod
metadata:
  labels:
    run: print-envars-greeting
  name: print-envars-greeting
spec:
  containers:
  - image: bash
    name: print-env-container
    env:
      - name: GREETING
        value: "Welcome to"
      - name: COMPANY
        value: "DevOps"
      - name: GROUP
        value: "Datacenter"
    command: ["/bin/sh", "-c", 'echo "$(GREETING) $(COMPANY) $(GROUP)"']
  restartPolicy: Never
```

## test
`kubectl logs -f print-envars-greeting`