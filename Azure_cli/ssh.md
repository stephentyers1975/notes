# SSH and keys
## connect to vm via entraid
`az vm ssh --name myVM --resource-group myResourceGroup`
## retrieve ssh private key from azure keyvault and store in file for traditional connect
`az keyvault secret show --name <your-secret-name> --vault-name <your-key-vault-name> --query "value" -o tsv > private_key.pem`