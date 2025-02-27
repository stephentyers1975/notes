## Generate ssh key pair for vm
`ssh-keygen -t rsa -b 2048 -f ~/.ssh/xfusion_key`
## Create static public IP
`az network public-ip create --resource-group <resource_group> --name xfusion-pip --allocation-method Static`
## create vm
`az vm create --name datacenter-vm --resource-group kml_rg_main-3aaa66ae94b34f5f --image Ubuntu2204 --size Standard_B1s --storage-sku Standard_LRS  --ssh-key-value ~/.ssh/id_rsa.pub --authentication-type ssh --admin-username azureuser`
## connect public IP to vm
`az network nic ip-config update --resource-group kml_rg_main-3aaa66ae94b34f5f --nic-name datacenter-vmVMNic --name ipconfigdatacenter-vm --public-ip-address datacenter-pip`
## show public ip
`az network public-ip show --resource-group kml_rg_main-3aaa66ae94b34f5f --name datacenter-pip`