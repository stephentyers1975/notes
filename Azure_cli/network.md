# Networks
## show nic configuration name
`az network nic show --resource-group <ResourceGroupName> --name <networkcardname> --query "ipConfigurations[].name" -o table`
## list nics on vm
`az vm nic list --resource-group <ResourceGroupName> --vm-name <VMName>`
## associate public IP to NIC
`az network nic ip-config update --resource-group <ResourceGroupName> --nic-name <networkcardname> --name <nic_config_name> --public-ip-address <pip_name>`
