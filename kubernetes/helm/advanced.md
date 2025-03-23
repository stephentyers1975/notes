# functions
## string functions

`{{ upper .Values.image.repository }}` -> uppercase
`{{ quote .Values.image.repository }}` -> put quotes around
`{{ replace "x" "y" .Values.image.repository }}` -> replace
`{{ shuffle .Values.image.repository }}` -> shuffle charts

## default value function 
`{{ default "nginx" .Values.image.repository }}`

# Pipelines -> move function to end of value with pipe
`{{ .Values.image.repository | upper }}`
`{{ .Values.image.repository | upper | quote }}`
`{{ .Values.image.repository | upper | quote | shuffle }}`

# conditionals
## if block
```
{{- if .Values.orgLabel }}
labels:
    org: {{ Values.orgLabel }}
{{- end }}
```
## else if 
```
{{- if .Values.orgLabel }}
labels:
    org: {{ Values.orgLabel }}
{{- else if eq .Values.orgLabel "hr" }}
labels:
    org: human resources
{{- end }}
```
* if block often used to create block in kubernetes template if a true condition is set for an attribute is set values.yaml

```
serviceAccount
  create: true
```

# Scope -> set to root scope by default
* use "with " block to shortcut scope
* use $. to still access root scope inside shortcut block

```
{{- with .Values.app }}


{{- end }}
```
# loops and ranges
```
{{- range .Values.regions}}
- {{ . | quote }}
{{- end }}
```

```
{{- with .Values.serviceAccount.create }}
apiVersion: v1
kind: ServiceAccount
metadata:
  name: {{ $.Values.serviceAccount.name }}
  labels:
    {{- range $key, $val := $.Values.serviceAccount.labels }}
    {{ $key }}: {{ $val }}
    {{- end }}
    app: webapp-color
{{- end }}
```
# Named Templates -> partial template for repeated code
* _helpers.tpl -> make sure template spaces match
```
{{- define "labels" }}
    app.kubernetes.io/name: {{ .Release.Name }}
    app.kubernetes.io/instances: {{ .Release.Name }}
{{- end }}
```
* service.yaml
```
labels:
  {{- template "labels" . }}
```
* use indent function with include to fix indentations
* {{- include "labels" . | indent 2 }}

# chart hooks -> extra actions like backup db before upgrade
* pre-upgrade hook
* post-upgrade hooks
* post install
* pre install
* pre-delete
* post-delete
* pre-rollback
* post-rollback
* add annotation in kubernetes template to let helm know it's a hook
* "helm.sh/hook: pre-upgrade"
* "helm.sh/hook-weight: "5""
* "helm.sh/hook-delete-policy: hook-succeeded"

```
apiVersion: apps/v1
kind: Deployment
metadata:
  labels:
  {{- include "labels" . | indent 2 }}
    app: webapp-color
  name: {{ .Values.name }}
spec:
  replicas: 1
  selector:
    matchLabels:
    {{- include "labels" . | indent 4 }}
      app: webapp-color
  template:
    metadata:
      labels:
      {{- include "labels" . | indent 6 }}
        app: webapp-color
    spec:
      containers:
      - image: kodekloud/webapp-color
        name: webapp-color
        envFrom:
         - configMapRef:
                name: {{ .Values.configMap.name }}
```
## example
_helpers.tpl
```
{{/*
Common labels
*/}}
{{- define "labels" }}
  unit: dev
{{- end }}
{{- define "webapp-color.selectorLabels" }}
  unit: dev
{{- end }}
```
deployment.yaml
```
apiVersion: apps/v1
kind: Deployment
metadata:
  labels:
  {{- include "labels" . | indent 2 }}
    app: webapp-color
  name: {{ .Values.name }}
spec:
  replicas: 1
  selector:
    matchLabels:
    {{- include "labels" . | indent 4 }}
      app: webapp-color
  template:
    metadata:
      labels:
        {{- include "labels" . | indent 6 }}
        app: webapp-color
    spec:
      containers:
      - image: kodekloud/webapp-color
        name: webapp-color
        envFrom:
         - configMapRef:
                name: {{ .Values.configMap.name }}
```
# Package charts
`helm package ./nginx-chart`
## sign chart
### generate gpg key
`gpg --quick-generate-key "John Smith"`
`gpg --full-generate-key "John Smith"`
## export into old format
`gpg --export-secret-keyss > ~/.gnupg/secring.gpg`
## package with key
`helm package --sign --key 'John Smith' --keyring ~/.gnupg/secring.gpg ./nginx-chart`
## list key details 
`gpg --list-keys`
* provenance file generated
* .prov
## verify integrity of chart
`helm verify ./nginx-chart-0.1.0.tgz`
## export public key
`gpg --export 'John Smith` > mypublickey
## verify integrity of chart using public key
`helm verify --keyring ./mypublickey ./nginx-chart-0.1.0.tgz`

# uploading charts
* copy provenance and archive files into new directory
`helm repo index nginx-chart-files/ --url https://example.com/charts`
* upload chart
