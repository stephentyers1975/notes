# Exercise - Configure multiple nodes and enable scale-to-zero on an AKS cluster

## Create a new resource group
```
REGION_NAME=eastus
RESOURCE_GROUP=rg-akscostsaving
AKS_CLUSTER_NAME=akscostsaving-$RANDOM
```
`echo $AKS_CLUSTER_NAME`
`az group create --name $RESOURCE_GROUP --location $REGION_NAME`

## Create the AKS cluster
### get kubernetes version in chosen region
```
VERSION=$(az aks get-versions --location $REGION_NAME --query "values[?isPreview==null].version | [-1]" --output tsv)
echo $VERSION
```
### create the cluster
`az aks create --resource-group $RESOURCE_GROUP --name $AKS_CLUSTER_NAME --location $REGION_NAME --kubernetes-version $VERSION --node-count 2 --load-balancer-sku standard --vm-set-type VirtualMachineScaleSets --generate-ssh-keys`
### list node pools
`az aks nodepool list --resource-group $RESOURCE_GROUP --cluster-name $AKS_CLUSTER_NAME`

## Add a node pool
`az aks nodepool add --resource-group $RESOURCE_GROUP --cluster-name $AKS_CLUSTER_NAME --name batchprocpl --node-count 2`
### list node pools
`az aks nodepool list --resource-group $RESOURCE_GROUP --cluster-name $AKS_CLUSTER_NAME`

## Scale the node-pool node count to zero
`az aks nodepool scale --resource-group $RESOURCE_GROUP --cluster-name $AKS_CLUSTER_NAME --name batchprocpl --node-count 0`

## Get cluster credntials and merge nto .config
`az aks get-credentials --resource-group $RESOURCE_GROUP --name $AKS_CLUSTER_NAME`

# Exercise - Configure spot node pools with the cluster autoscaler on an AKS cluster
[Microsoft Learn](https://learn.microsoft.com/en-us/training/modules/aks-optimize-compute-costs/5-exercise-spot-node-pools)
`az aks nodepool add --resource-group $RESOURCE_GROUP --cluster-name $AKS_CLUSTER_NAME --name batchprocpl2 --enable-cluster-autoscaler --max-count 3 --min-count 1 --priority Spot --eviction-policy Delete --spot-max-price -1 --node-vm-size Standard_DS2_v2 --no-wait`

## list no pools
`az aks nodepool show --resource-group $RESOURCE_GROUP --cluster-name $AKS_CLUSTER_NAME --name batchprocpl2`

# Configure a namespace
`kubectl create namespace costsavings`

# Schedule a pod with spot node affinity
`code spot-node-deployment.yaml`
```
apiVersion: v1
kind: Pod
metadata:
  name: nginx
  labels:
    env: test
spec:
  containers:
  - name: nginx
    image: nginx
    imagePullPolicy: IfNotPresent
  tolerations:
  - key: "kubernetes.azure.com/scalesetpriority"
    operator: "Equal"
    value: "spot"
    effect: "NoSchedule"
  affinity:
    nodeAffinity:
      requiredDuringSchedulingIgnoredDuringExecution:
        nodeSelectorTerms:
        - matchExpressions:
          - key: "kubernetes.azure.com/scalesetpriority"
            operator: In
            values:
            - "spot"
```
`kubectl apply --namespace costsavings -f spot-node-deployment.yaml`
`kubectl get pods --namespace costsavings -o wide`

# Enable the ContainerService and PolicyInsights resource providers

## register providers
`az provider register --namespace Microsoft.ContainerService`
`az provider register --namespace Microsoft.PolicyInsights`
`az feature register --namespace Microsoft.ContainerService --name AKS-AzurePolicyAutoApprove`
## check registration
`az feature list -o table --query "[?contains(name, 'Microsoft.ContainerService/AKS-AzurePolicyAutoApprove')].   {Name:name,State:properties.state}"`
## run the provider to propagate 
`az provider register -n Microsoft.ContainerService`

# Enable the Azure Policy on your cluster
`az aks enable-addons --addons azure-policy --name $AKS_CLUSTER_NAME --resource-group $RESOURCE_GROUP`
`kubectl get pods -n kube-system`
`kubectl get pods -n gatekeeper-system`
`az aks show --resource-group $RESOURCE_GROUP --name $AKS_CLUSTER_NAME -o table --query "addonProfiles.azurepolicy"`

# Assign a built-in policy definition
[Microsoft learn link](https://learn.microsoft.com/en-us/training/modules/aks-optimize-compute-costs/7-exercise-resource-quota-azure-policy)