# Linux Configure sudo
a. Provide sudo access to user mariyam on all app servers.
b. Make sure you have set up password-less sudo for the user.

## edit sudoers file on each serve
`visudo`
## insert below int0 file
`mariyam ALL=(ALL) NOPASSWD:ALL`


## With script
```
#!/bin/bash

# List of remote servers and their respective sudo users
servers=(
    "tony@stapp01"
    "steve@stapp02"
    "banner@stapp03"
)

# Function to install squid on a remote server
install_squid() {
    ssh -t -o StrictHostKeyChecking=no "$1" "
    sudo bash -c 'echo "mariyam ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers'
    "
}

# Loop through each server and install squid
for server in "${servers[@]}"; do
    install_squid "$server"
done
```




sudo bash -c 'echo "mariyam ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers'