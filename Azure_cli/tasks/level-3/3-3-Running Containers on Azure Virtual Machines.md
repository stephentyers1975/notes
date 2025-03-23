# Running Containers on Azure Virtual Machines
The Nautilus DevOps team needs to set up an Azure Virtual Machine (VM) to interact with an Azure Blob Storage container for storing and retrieving data. The team must create a private storage account, configure Blob Storage, and test the functionality.

Task:
1) Azure Virtual Machine Setup:

The VM named nautilus-vm already exists in the East US region.
2) Create a Private Storage Account and Blob Container:

Create a storage account named nautilusstor19924 in the East US region with Locally-redundant storage (LRS).
`az storage account create --name nautilusstor19924 --location eastus --sku Standard_LRS --resource-group kml_rg_main-2bf2eea72f8f4785 --public-network-access Disabled`
Create a private Blob container named nautilus-container19924.
`az storage container create --name nautilus-container19924 --account-name nautilusstor19924 --public-access off`
3) Retrieve Storage Account Key:
`az storage account keys list --account-name nautilusstor19924`
Get the storage account's access key to configure access for the application.
4) Create a Test File:

SSH into the VM and create a file named testfile.txt in the /home/azureuser directory with content: "this is a test file".
`az vm list-ip-addresses --resource-group KML_RG_MAIN-2BF2EEA72F8F4785 --name nautilus-vm --out table`
`ssh azureuser@20.42.51.192`
`echo "this is a test file" > testfile.txt `

5) Upload the File to Blob Storage:

Upload the testfile.txt file to the Blob container nautilus-container19924 using the Azure CLI command:
`az storage blob upload --account-name nautilusstor19924 --account-key <$ACCOUNT_KEY>--container-name nautilus-container19924 --name testfile.txt --file /home/azureuser/testfile.txt`

