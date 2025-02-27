# Linux SSH Authentication
The system admins team of xFusionCorp Industries has set up some scripts on jump host that run on regular intervals and perform operations on all app servers in Stratos Datacenter. To make these scripts work properly we need to make sure the thor user on jump host has password-less SSH access to all app servers through their respective sudo users (i.e tony for app server 1). Based on the requirements, perform the following:

Set up a password-less authentication from user thor on jump host to all app servers through their respective sudo users.

## set up public/private key on jumphost
`ssh-keygen -t rsa -b 4096 -C "thor@jump_host"`
## run script to add public key to app servers
```
#!/bin/bash

# List of app servers and their respective sudo users
servers=(
    "tony@stapp01"
    "steve@stapp02"
    "banner@stapp03"
)

# Path to the SSH public key
public_key="/home/thor/.ssh/id_rsa.pub"

# Function to copy the SSH key to a server
copy_ssh_key() {
    local user_server=$1
    ssh-copy-id "$user_server"
}

# Copy the SSH key to each server
for server in "${servers[@]}"; do
    echo "Setting up password-less SSH for $server"
    copy_ssh_key "$server"
done

echo "Password-less SSH setup complete for all servers."
```