# VM commands

## list public ip's of a vm
`az vm list-ip-addresses --name vm_hostname --query "[].virtualMachine.network.publicIpAddresses[0].ipAddress" --output tsv`
## create a vm
```
az vm create -n MyVm -g MyResourceGroup \
            --image Ubuntu2204 --size Standard_DS1_v2  --storage-sku Standard_LRS \
            --generate-ssh-keys --authentication-type ssh
```
## delete a vm
`az vm delete --name datacenter-vm -g kml_rg_main-ef6fdc6b409b44c4`
`az vm delete --name datacenter-vm -g kml_rg_main-ef6fdc6b409b44c4 --yes`
## stop a vm
`az vm stop --resource-group MyResourceGroup --name MyVM`
## deallocate a vm
`az vm deallocate --resource-group <ResourceGroupName> --name <VMName>`
## start a vm
`az vm start --resource-group <ResourceGroupName> --name <VMName>`
## view vm ip addresses
`az vm list-ip-addresses -g <ResourceGroupName> -n <VMName>`
## list disks
`az disk list`
## attach disk to vm
`az vm disk attach --resource-group <ResourceGroupName> --vm-name <VMName> --name <DiskName>`
`az vm show --resource-group <ResourceGroupName> --name <VMName> --show-details`
### or table format
`az vm show --resource-group <ResourceGroupName> --name <VMName> --show-details -o table`
### or json format
`az vm show --resource-group <ResourceGroupName> --name <VMName> --show-details -o json`
### filter columns
`az vm show --resource-group <ResourceGroupName> --name <VMName> --query "{name:name, location:location, size:hardwareProfile.vmSize}" -o table`
### filter for public ip
`az vm show --resource-group <ResourceGroupName> --name <VMName> --show-details --query "{name:name, publicIp:publicIps[0].address, privateIp:privateIps[0].address}" -o table`
### list specific disk detaild
`az vm show --resource-group <ResourceGroupName> --name <VMName> --query "{name:name, disks:storageProfile.dataDisks[*].{diskName:name, diskSize:sizeGb}}" -o table`
## add NIC to vm
`az vm nic add --resource-group <ResourceGroupName> --vm-name <VMName> --nics <NicName>`
## list a vm's NICS
`az vm nic list --resource-group <ResourceGroupName> --vm-name <VMName>`
## associate public ip to nic
`az network nic ip-config update --resource-group <ResourceGroupName> --nic-name <NicName> --name <IpConfigName> --public-ip-address <PublicIpName>`