# Helm

## install script
```
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
```
## install via package manager
```
curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null
sudo apt-get install apt-transport-https --yes
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
sudo apt-get update
sudo apt-get install helm
```

# Helm Components

* helm cli
* helm charts - collection of config fles for application
* release -> specific release of application using a helm chart
* revisions -> multple revisions in each release
* helm charts exist in public repos
* metadata - stored as secrets in cluster
* check artifact hub for helm charts you can use

!["helm overview"](/images/helm1.png)



# chart components
* Template
* Values.yaml
* chart.yaml

!["helm overview"](/images/helm2.png)

# commands
## install an app
`helm install [release name] [chart name]`
## get help
`helm --help`
## search for chart
`helm search hub chart_name`
### or repo
`helm search repo chart_name`
## example
`helm repo add bitnami https://charts.bitnami.com/bitnami`
## deploy application
`helm install my-release bitnami/wordpress`
## list releses
`helm list`
## remove an app
`helm uninstall my-release`
## manage repos
`helm repo`
## list repo
`helm repo list`
## update repo info
`helm repo update`

# customizing chart parameters
## option 1 pass inline parameters
`helm install --set wordpressBlogName= "helm tutorials" my-release bitnami/wordpress`
## option 2 use custom_values.yaml
`helm install --values custom_values.yaml my-release bitnami/wordpress`
## modify original values yaml
### 1. pull chart
`helm pull bitname/wordpress`
* with untar
`helm pull --untar bitnami/wordpress`
* creates app folder with all the build files that can be edited
`helm install my-release ./wordpress`