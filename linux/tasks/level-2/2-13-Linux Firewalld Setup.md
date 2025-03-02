# Linux Firewalld Setup


## With script
```
#!/bin/bash

# List of remote servers and their respective sudo users
servers=(
    "steve@stapp02"
    "banner@stapp03"
)

# Function to install firewalld on a remote server
install_firewall() {
    echo "Configuring firewalld on $1"
    ssh -t -o StrictHostKeyChecking=no "$1" "
    sudo yum install -y firewalld
    sudo systemctl start firewalld
    sudo systemctl enable firewalld

    # Allow incoming connections on Nginx port 80
    sudo firewall-cmd --zone=public --permanent --add-port=80/tcp

    # Block incoming connections on Apache port 8080
    sudo firewall-cmd --zone=public --permanent --remove-port=8080/tcp

    # Reload the firewall to apply changes
    sudo firewall-cmd --reload

    # Ensure Apache and Nginx services are running
    sudo systemctl start httpd || sudo systemctl start apache2
    sudo systemctl enable httpd || sudo systemctl enable apache2
    sudo systemctl start nginx
    sudo systemctl enable nginx
    "
}

# Loop through each server and install firewall
for server in "${servers[@]}"; do
    install_firewall "$server"
done
echo "Finished configuring servers"
```