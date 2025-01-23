# multiple schedulers

* kubernetes is extensible and you can have your own custom scheduler service
* pods can be deployments using custom scheduler
* my-custom-scheduler.yaml

# 1. Deploy additional scheduler as custom binary - not common
* create or download binary
* create service config unit file kube-scheduler.service
```
ExecStart=/usr/local/bin/kube-scheduler \\
  --config=/etc/kubernetes/config/kube-scheduler.yaml
```
* point to config YAML
## default scheduler
```
apiVersion: kubescheduler.config.k8s.io/v1
kind: KubeSchedulerConfiguration
profiles:
- schedulerName: default-scheduler
```
## custom scheduler
```
apiVersion: kubescheduler.config.k8s.io/v1
kind: KubeSchedulerConfiguration
profiles:
- schedulerName: my-scheduler
```
# 2. Deploy additional scheduler as pod
```
apiVersion: apps/v1
kind: Deployment
metadata:
  labels:
    component: scheduler
    tier: control-plane
  name: my-scheduler
  namespace: kube-system
spec:
  selector:
    matchLabels:
      component: scheduler
      tier: control-plane
  replicas: 1
  template:
    metadata:
      labels:
        component: scheduler
        tier: control-plane
        version: second
    spec:
      serviceAccountName: my-scheduler
      containers:
      - command:
        - /usr/local/bin/kube-scheduler
        - --config=/etc/kubernetes/my-scheduler/my-scheduler-config.yaml
        image: gcr.io/my-gcp-project/my-kube-scheduler:1.0
        livenessProbe:
          httpGet:
            path: /healthz
            port: 10259
            scheme: HTTPS
          initialDelaySeconds: 15
        name: kube-second-scheduler
        readinessProbe:
          httpGet:
            path: /healthz
            port: 10259
            scheme: HTTPS
        resources:
          requests:
            cpu: '0.1'
        securityContext:
          privileged: false
        volumeMounts:
          - name: config-volume
            mountPath: /etc/kubernetes/my-scheduler
      hostNetwork: false
      hostPID: false
      volumes:
        - name: config-volume
          configMap:
            name: my-scheduler-config
```
# configure pod to use custom scheduler
* add to definition yaml schedulerName: my-custom-scheduler

# view events to check scheduler activity
`kubectl get events -o wide`
## view scheduler logs
`kubectl logs my-custom-scheduler --name-space=kube-system`

!["scheduler1](/images/scheduler-profiles.png)

!["scheduler1](/images/scheduler-profiles2.png)

!["scheduler1](/images/scheduler-profiles3.png)