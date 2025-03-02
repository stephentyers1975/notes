# DNS Troubleshooting
The system admins team of xFusionCorp Industries has noticed intermittent issues with DNS resolution in several apps . App Server 3 in Stratos Datacenter is having some DNS resolution issues, so we want to add some additional DNS nameservers on this server.

As a temporary fix we have decided to go with Google public DNS (ipv4). Please make appropriate changes on this server.

## edit resolv.conf
`vi /etc/resolv.conf`
## edit nameserver in resolv.conf
`nameserver 8.8.8.8`