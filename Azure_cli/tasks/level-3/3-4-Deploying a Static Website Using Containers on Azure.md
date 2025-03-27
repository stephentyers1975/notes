# Deploying a Static Website Using Containers on Azure
The Nautilus DevOps team has been tasked with creating an internal information portal for public access. As part of this project, they need to host a static website on Azure using an Azure Storage account. The Storage account must be configured for public access to allow external users to access the static website directly via the Azure Storage URL.

Task Requirements:

Create an Azure Storage account named nautiluswebst14407 in an existing resource group.
`az storage account create --name nautiluswebst14407 --location eastus --sku Standard_LRS --resource-group kml_rg_main-3a4f31727c8744aa`
Configure the Storage account for static website hosting with index.html as the index document.
`az storage blob service-properties update --account-name nautiluswebst14407 --static-website true --index-document index.html`
Allow public access to the static website so that the website is publicly accessible.
Upload the index.html file from the /root/ directory of the Azure client host to the Storage account's $web container.
`az storage blob upload --account-name nautiluswebst14407 --container-name '$web' --name index.html --file /root/index.html`
Verify that the website is accessible directly through the Azure Storage static website URL.
`az storage account show --name nautiluswebst14407 --resource-group kml_rg_main-3a4f31727c8744aa --query primaryEndpoints.web -o tsv`
`curl https://nautiluswebst14407.z13.web.core.windows.net/`