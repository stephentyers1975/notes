# Fundementals

## deploy a template
`az deployment group create --name main --template-file main.bicep`
## with params
`az deployment group create --name main --template-file exercise1.bicep --parameters environmentType=nonprod --resource-group mslearn-bicep`
## list deployments against resource group
`az deployment group list --resource-group rg_name --output table`
## convert bicep into arm json file
`az bicep build --file {bicep_file}`