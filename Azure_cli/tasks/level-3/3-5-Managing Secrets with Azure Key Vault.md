# Managing Secrets with Azure Key Vault
The Nautilus DevOps team is focusing on improving their data security by using Azure Key Vault. Your task is to create a Key Vault with a key and manage the encryption and decryption of a pre-existing sensitive file using this key.

Specific Requirements:

Create a Key Vault:

Name the Key Vault datacenter-15670.
Set access policies to allow encryption and decryption operations.
* in portal or az cli
```
# Define variables
KEY_VAULT_NAME="datacenter-15670"
RESOURCE_GROUP="<your_resource_group_name>" # Replace with your resource group name
USER_OBJECT_ID=$(az ad signed-in-user show --query id -o tsv) # Get the object ID of the currently signed-in user

# Create the Key Vault
az keyvault create \
    --name "$KEY_VAULT_NAME" \
    --resource-group "$RESOURCE_GROUP" \
    --location "eastus" # Choose a location appropriate to your needs

# Set access policies for encryption and decryption
az keyvault set-policy \
    --name "$KEY_VAULT_NAME" \
    --resource-group "$RESOURCE_GROUP" \
    --object-id "$USER_OBJECT_ID" \
    --key-permissions encrypt decrypt

echo "Key Vault '$KEY_VAULT_NAME' created and access policies set."
```

Create a Key:

Create a symmetric key named datacenter-key within the Key Vault for encryption and decryption operations.
`az keyvault key create --vault-name datacenter-15670 --name datacenter-key --ops encrypt decrypt`

Encrypt the Sensitive Data:

Use the key to encrypt the provided SensitiveData.txt file (located in /root/) on the azure-client host.

Base64 encode the ciphertext and save the encrypted version as EncryptedData.bin in the /root/ directory.
`az keyvault key encrypt --name datacenter-key --vault-name datacenter-282 --algorithm RSA-OAEP --value "$(cat /root/SensitiveData.txt | base64)" | jq -r '.result' > /root/EncryptedData.bin`


Verify Decryption:

Attempt to decrypt EncryptedData.bin and verify that the decrypted data matches the original SensitiveData.txt file.
Ensure that the Key Vault and key are correctly configured. The validation script will test your configuration by decrypting the EncryptedData.bin file using the key you created.
`az keyvault key decrypt --name datacenter-key --vault-name datacenter-282 --algorithm RSA-OAEP --value "$(cat /root/EncryptedData.bin)" | jq -r .result | base64 -d > decrypteddata.txt`