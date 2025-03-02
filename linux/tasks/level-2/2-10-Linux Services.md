# Linux Services
a. Install squid package on all the application servers.
b. Once installed, make sure it is enabled to start during boot.

## script install
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
    ssh -t -o NoHostAuthenticationForLocalhost "$1" "
    echo "Installing squid on $1"
    sudo yum install squid -y || sudo apt-get install squid -y
    sudo systemctl start squid && sudo systemctl enable squid
    "
}

# Loop through each server and install squid
for server in "${servers[@]}"; do
    install_squid "$server"
done
```