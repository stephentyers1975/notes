# VM commands
## list public ip's of a vm
`az vm list-ip-addresses --name vm_hostname --query "[].virtualMachine.network.publicIpAddresses[0].ipAddress" --output tsv`