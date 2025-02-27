# Synchronizing Containers Using the CLI
Create a New Private Azure Blob Container: Name the container nautilus-dest-27613 under the storage account nautilusstorage10363.

Data Migration: Migrate the file nautilus.txt from the existing nautilus-source-13361 container to the new nautilus-dest-27613 container.

Ensure Data Consistency: Ensure that both containers have the file nautilus.txt and confirm the file content is identical in both containers.

Use Azure CLI: Use the Azure CLI to perform the creation and data migration tasks.

## Create blob container
`az storage container create  --account-name nautilusstorage10363 --name nautilus-dest-27613 --public-access off`
## copy data between containers
`az storage blob copy start --account-name nautilusstorage10363 --destination-container nautilus-dest-27613 --destination-blob nautilus.txt --source-container nautilus-source-13361 --source-blob nautilus.txt`
## check data consistency between 2 containers
```
az storage blob download \
    --account-name nautilusstorage10363 \
    --container-name nautilus-source-13361 \
    --name nautilus.txt \
    --file nautilus-source-nautilus.txt

az storage blob download \
    --account-name nautilusstorage10363 \
    --container-name nautilus-dest-27613 \
    --name nautilus.txt \
    --file nautilus-dest-nautilus.txt

```
`diff nautilus-source-nautilus.txt nautilus-dest-nautilus.txt`