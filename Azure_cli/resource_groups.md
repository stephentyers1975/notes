# Resource Groups
## list resource groups
`az group list`
## Query particular resource group
`az group list --query '[].name' --output table | grep 'kml'`