# Ubuntu network settings
## view netplan config
`sudo netplan get`
## netplan config file directory
`/etc/netplan/`
## netplan manual - search 'address label' or 'default routes'
`man netplan`
## example YAML file - prefix with number
```
network:
    ethernets:
        enp0s3:
            dhcp4: false
            dhcp6: false
            addresses:
                - 10.0.0.9/24
                - fe80::921b:eff:fe3d:abcd/64
            nameservers:
                addresses:
                    - 8.8.4.4
                    - 8.8.8.8
            routes:
                - to: 192.168.0.0/24
                  via: 10.0.0.100
                - to: default
                  via: 10.0.0.1
    version: 2
```
## test config with try
`sudo netplan try`
## apply config immediately
`sudo netplan apply`
## test config with try with edited timeout
`sudo netplan try --timeout 30`
## change permissions on config file
`sudo chmod 600 /etc/netplan/configyaml`
## check route table
`ip route`
## check dns servers full output
`resolvectl status`
## check dns servers concise output
`resolvectl dns`
## edit dns globally
`vi /etc/systemd/resolved.conf`
## restart resolved service to apply changes
`sudo systemctl restart systemd-resolved.service`
## hosts file lcoation
`/etc/hosts`

# Ubuntu Network service
## view apps listening and ready to accept incoming connections
`sudo ss -ltunp`
### or legacy
`netstat -ltunp`
## list all incoming ports with netstat
`sudo netstat -tulpn | grep LISTEN > incoming.txt`



# IPTABLES Firewall - INPUT CHAIN (incoming traffic rules), OUTPUT CHAIN (outgoing traffic rules), FORWARD CHAIN (forwarding for router type traffic)
## install on Ubuntu, should be installed by default on redhat or centos systems
`sudo apt install iptables`
## list default rules
`iptables -L`
## command key
-A -> Add rule to bottom of list
-I -> Add rule to top of list or index number after chain name (INPUT 2 e.g.) 
-p -> Protocol
-s -> Source  
-d -> Destination
--dport -> Destination port
-j -> Action to take  
## Add accept rule to chain
`iptables -A INPUT -p tcp -s 172.16.238.187 --dport 22 -j ACCEPT`
## Add deny rule to chain
`iptables -A INPUT -p tcp --dport 22 -j DROP`
## Add accept rule to top of chain using - I
`iptables -I OUTPUT -p tcp -d 172.16.238.100 --dport 443 -j ACCEPT `
## delete a rule at position 5
`iptables -D OUTPUT 5`
## DROP all rule on INPUT chain
`iptables -A INPUT -j DROP`
## misc rules
`iptables -A OUTPUT -p tcp -d 172.16.238.11  --dport 5432 -j ACCEPT`
`iptables -A OUTPUT -p TCP -d 172.16.238.15 --dport 80 -j ACCEPT`
`iptables -A OUTPUT -p TCP --dport 80 -j DROP`
`iptables -A OUTPUT -p TCP --dport 443 -j DROP`