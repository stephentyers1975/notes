# Linux Banner
Update the message of the day on all application and db servers for Nautilus. 
Make use of the approved template located at /home/thor/nautilus_banner on jump host
## run below for each server
`scp /home/thor/nautilus_banner tony@stapp01:/tmp`
`ssh tony@stapp01 "sudo -S mv /tmp/nautilus_banner /etc/motd"`

## script ideas
```
#!/bin/bash

# List of application and database servers
servers=("app_server_1" "app_server_2" "db_server_1" "db_server_2")

# Path to the MOTD template
motd_template="/home/thor/nautilus_banner"

# Loop through each server and update the MOTD with sudo
for server in "${servers[@]}"; do
    echo "Updating MOTD on $server"
    scp "$motd_template" thor@"$server":/tmp/motd_temp
    ssh thor@"$server" "sudo mv /tmp/motd_temp /etc/motd"
done

echo "MOTD update complete on all servers."
```