# Helm

## clone sample application
`git clone https://github.com/Azure-Samples/aks-store-demo.git`

## create azure resources
### RG
`az group create --name aks-store-rg --location uksouth`
### Container Registry
`az acr create --resource-group aks-store-rg --name tyersacr --sku Basic`
### create AKS cluster and attach registry
`az aks create --resource-group aks-store-rg --name storedemo --node-count 2 --attach-acr tyersacr --generate-ssh-keys`
### get credentials for kube config file
`az aks get-credentials --resource-group aks-store-rg --name storedemo`

## Install helm chart
`cd aks-store-demo`
`cd charts`
`helm install aks-store-demo ./aks-store-demo`

## Helm commands
### view releases
`helm list`
### view manifest of release
`helm get manifest aks-store-demo`
### delete helm release
`helm delete aks-store-demo`
### install helm chart with set values
`helm install --set replicaCount=5 aks-store-demo ./aks-store-demo`