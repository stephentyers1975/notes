# Troubleshooting Public Virtual Network Configurations
## get vm details
`az vm list`
## get nic configuration details
`az network nic list`
## associate public ip to vm nic
`az network nic ip-config update --resource-group kml_rg_main-83d6c7e74a0745f8 --nic-name nautilus-vmVMNic --name ipconfignautilus-vm --public-ip-address nautilus-pip`
## verify PIP is associated to vm
`az vm list-ip-addresses --name vm_hostname --query "[].virtualMachine.network.publicIpAddresses[0].ipAddress" --output tsv`
