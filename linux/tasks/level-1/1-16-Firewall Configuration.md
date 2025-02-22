# Firewall Configuration
Allow all incoming connections on port 8083/tcp. Ensure the zone is set to public
`firewall-cmd --zone=public --add-port=8083/tcp --permanent`
## check ports
`firewall-cmd --zone=public --list-ports`