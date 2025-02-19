# Commands

# connect to cluster
`az login`
`az account set --subscription sub_id`
`az aks get-credentials --resource-group rg_name --name cluster_name --overwrite-existing`
## scale cluster nodes
`az aks scale --resource-group rg_name --name kodekloud-demo --node-count 3`