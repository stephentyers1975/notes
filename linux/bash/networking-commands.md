# Networking commands
# show IP
`ip a`
## show ip interfaces information and addresses
`ip addr show`
## show ip devices
`ip link show`
## add ip to interface
`ip addr add 192.168.1.10/24 dev eth0`
## bring interface up
`sudo ip link set [Interface name] up`
## network interface file for permanant changes (legacy)
`/etc/network/interfaces_file`
## show kernel route information
`route`
## add route
`ip route add 192.168.2.0/24 via 192.168.1.1`  
`ip route add destination_subnet/mask via router_interface_ip`
## add default route
`ip route add default via router_interface_ip` 
## delete default route
`ip route del default`
### or
`ip route add 0.0.0.0 via router_interface_ip` 
# DNS
## host file
`/etc/hosts`
## lookup commands
`nslookup host_name`
###
`dig hostname`
## DNS server file
`/etc/resolv.conf`  
`nameserver     ip_address`  
`search         mycompany.com   prod.mycompany.com`
## host / dns lookup order config file
`/etc/nsswitch.conf`  
## check if port is open and listening
`netstat -an | grep 80 | grep -i LISTEN`
## check connectivity with netcat
`nc localhost 8080`
