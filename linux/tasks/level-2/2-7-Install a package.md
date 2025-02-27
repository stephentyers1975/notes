# Install a package
install the samba package on all app-servers.

`yum install -y samba`
`systemctl enable --now smb`

## script idea
```
#!/bin/bash

# Server IP or hostname
server="app_server_1"

# Function to install Samba on the server
install_samba() {
    ssh thor@"$server" <<EOF
        sudo apt update
        sudo apt install samba -y
        samba --version
        systemctl enable --now smb
EOF
}

# Run the installation function
install_samba
```