# Managing Storage Lifecycle in Azure

The Nautilus DevOps team needs to optimize data retention costs by automating the deletion of old blobs. They plan to implement Blob Lifecycle Management for a specific container in Azure Storage.

Task:
1) Create a Storage Account:
`az storage account create --name datacenterstor26231 --location eastus --sku Standard_LRS --resource-group kml_rg_main-28c4c7e609ff4d44`

Name the storage account datacenterstor26231.
Set the region to East US.
Use Locally-redundant storage (LRS) as the redundancy option.
2) Create a Blob Container:
`az storage container create --name datacenter-container26231 --account-name datacenterstor26231`
Name the container datacenter-container26231.

3) Upload a File to the Container:
`az storage blob upload --container-name datacenter-container26231 --file /root/tempfile.txt --account-name datacenterstor26231`
Upload the file named tempfile.txt to the container. The file is present under /root of the client host.

4) Configure Blob Lifecycle Management:
Completed in portal
```
az storage account management-policy create \
  --account-name datacenterstor26231 \
  --resource-group kml_rg_main-28c4c7e609ff4d44 \
  --policy @policy.json
```
policy.json
```
{
  "rules": [
    {
      "enabled": true,
      "name": "datacenter-del-rule",
      "type": "Lifecycle",
      "definition": {
        "actions": {
          "baseBlob": {
            "delete": {
              "daysAfterModificationGreaterThan": 7
            }
          }
        },
        "filters": {
          "blobTypes": [
            "blockBlob"
          ],
          "prefixMatch": [
            "datacenter-container26231/*"
          ]
        }
      }
    }
  ]
}
```
Apply a Lifecycle Management rule named datacenter-del-rule to the container datacenter-container26231 to delete blobs after 7 days of last modification.
5) Validation:

Verify that the Lifecycle Management rule named datacenter-del-rule is correctly applied.