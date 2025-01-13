# Storage Commands
## Blob and containers
### blob file upload
```
az storage blob upload \
    --account-name <storage-account-name> \
    --container-name <container-name> \
    --name <blob-name> \
    --file <local-file-path>
```
## create managed disk
`az disk create --resource-group <ResourceGroupName> --name <DiskName> --size-gb 2 --sku Standard_LRS`
## create storage account
`az storage account create --name <storage_account_name> --resource-group <ResourceGroupName> --location <Location> --sku Standard_LRS`
## create private blob container
`az storage container create --account-name <storage_account_name> --name <blob_container_name> --public-access off`
## create public blob container
`az storage container create --account-name <storage_account_name> --name <blob_container_name> --public-access blob`
## set exisiting blob container to private
`az storage container set-permission --account-name <storage_account_name> --name <blob_container_name> --public-access off`
## enable storage account public blob access
`az storage account update --name <storage_account_name> --resource-group <ResourceGroupName> --allow-blob-public-access true`
## verify storage account access
`az storage account show --name <StorageAccountName> --resource-group <ResourceGroupName> --query "properties.allowBlobPublicAccess"`
## set anonymous read access to blob container
`az storage container set-permission --account-name <storage_account_name> --name <blob_container_name> --public-access container --auth-mode key`
## delete blob container
`az storage container delete --account-name <StorageAccountName> --name <ContainerName>`

# AZcopy
## download and install azcopy
`wget https://aka.ms/downloadazcopy-v10-linux`
`tar -xvf downloadazcopy-v10-linux`
`sudo cp ./azcopy_linux_amd64_*/azcopy /usr/bin/`
## list storage account keys
`az storage account keys list --resource-group <ResourceGroupName> --account-name <StorageAccountName> --query "[0].value" --output tsv`
## login to azcopy
`azcopy login`
## copy files
`azcopy copy "https://devopsstorage2313.blob.core.windows.net/devops-blob-10989" "<target_dir>" --recursive`
`azcopy copy "<src_dir>" "https://devopsstorage10631.blob.core.windows.net/devops-blob-32320"`