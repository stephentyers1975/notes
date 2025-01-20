# Deploying Virtual Machines in a Public Virtual Network
* create vnet and subnet in portal
## create vm with cli
`az vm create --name devops-pub-vm --resource-group kml_rg_main-817ff3c64066484d --image Ubuntu2204 --size Standard_B1s --vnet-name devops-pub-vnet --storage-sku Standard_LRS  --authentication-type ssh --admin-username azureuser --generate-ssh-keys --subnet devops-pub-subnet --location eastus`