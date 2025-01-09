# VM commands
## list public ip's of a vm
`az vm list-ip-addresses --name vm_hostname --query "[].virtualMachine.network.publicIpAddresses[0].ipAddress" --output tsv`
## create a vm
```
az vm create -n MyVm -g MyResourceGroup \
            --image Ubuntu2204 --size Standard_DS1_v2  --storage-sku Standard_LRS \
            --generate-ssh-keys --authentication-type ssh
```

