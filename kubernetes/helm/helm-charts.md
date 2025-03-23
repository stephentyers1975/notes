# Helm charts

## create helm chart - basic nginx with nodePort service
```
hello-world-chart
-> templates(folder)
   values.yaml
   Chart.yaml
   LICENSE
   README.MD
```
1. ## create chart folder skeleton/structure
`helm create nginx-chart`
## edit chart.yaml metadata
`vi Chart.yaml`
## get rid of builtin templates
`rm -r templates/*`

2. * move deployment and service templates into helm template directory

3. Templatize the release
* {{ .Release.Name }}-nginx
* Release.Name
* Release.Namespace
* Release.IsUpgrade
* Release.IsInstall
* Release.Revision
* Release.Service
* Chart.Name
* Chart.ApiVersion
* Chart.Version
* Chart.Type
* Chart.Keywords
* Chart.Home
* Capabilities.KubeVision
* Capabilities.ApiVersions
* Capabilities.HelmVersion
* Capabilities.GitCommit
* Capabilities.GitTreeState
* Capabilities.GoVersion
* Values.replicaCount
* Values.image

* define in Values.yaml or pass in during install
* {{ .Values.image.repository }}


3. Verify 
* Linting
* template
* dry run

## Linting
`helm lint ./nginx-chart`
## verify templates are generated correctly
`helm template ./nginx-chart`
## verify templates are generated correctly - pass in release name
`helm template release-name ./nginx-chart`
## use debug flag to pinpoint template with errors
`helm template ./nginx-chart --debug`
## use dry run to catch yaml errors in the underlying kubernetes templates
`helm install hello-world-1 ./nginx-chart --dry-run`