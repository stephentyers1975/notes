# 2-2-Configuring Instances with User Data
## custom nginx build script
```
#!/bin/bash
# Update package lists
sudo apt-get update

# Install Nginx
sudo apt-get install -y nginx

# Start Nginx service
sudo systemctl start nginx
sudo systemctl enable nginx

```
## build new vm and include script
`az vm create --name nautilus-vm --resource-group kml_rg_main-1daf26f13de4430d --image Ubuntu2204 --size Standard_B1s --storage-sku Standard_LRS  --authentication-type ssh --admin-username azureuser --generate-ssh-keys --custom-data ./nginx_build.sh `
## Add http allow inbound rule to VM nic
`az network nsg rule create --resource-group kml_rg_main-1daf26f13de4430d --nsg-name nautilus-vmNSG --name AllowHTTP --protocol tcp --direction Inbound --priority 1001 --source-address-prefix Internet --source-port-range * --destination-address-prefix * --destination-port-range 80 --access Allow`