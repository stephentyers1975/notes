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

# Bridging and Bonding
* Bridge - glues together 2 or mor networks
* Bond - glues together 2 or more network connections
## Bonding Modes
* Mode 0 - round robin
* Mode 1 - active backup
* Mode 2 - XOR
* Mode 3 - broadcast
* Mode 4 - IEEE 802.3ad
* Mode 5 - adaptive transmit load balancing
* Mode 6 - adaptive load balancing

## configuring bridging on Ubuntu

## example configuration files
`/usr/share/doc/netplan/examples/bridge.yaml`
## copy example into configuration directory
`/etc/netplan/99-bridge.yaml`
## change permissions
`sudo chmod 600 99-bridge.yaml`
## edit file and apply changes
`sudo netplan try`
## delete bridge interface
`sudo ip link delete br0`

## configuring bonding on Ubuntu
## example configuration files
`/usr/share/doc/netplan/examples/bonding.yaml`
## copy example into configuration directory
`/etc/netplan/99-bonding.yaml`
## change permissions
`sudo chmod 600 99-bonding.yaml`
## YAML config file
```
network:
  version: 2
  renderer: networkd
  ethernets:
    enp0s8:
      dhcp4: false
    enp0s9:
      dhcp4: false
  bonds:
    bond0:
      dhcp4: yes
      interfaces:
        - enp0s8
        - enp0s9
      parameters:
        mode: active-backup
        primary: enp0s8
        mii-monitor-interval: 100
```
## view bonding options - search bonding
`man netplan` 
## app configuration
`sudo netplan apply`
## view bond detail
`/proc/net/bonding/bond_interface`

# Firewall - Packet filtering Ubuntu
## check ufw status - uncomplicated firewall - blocks all incoming by default. uses whitelist approach
`sudo ufw status`
## create rule
`sudo ufw allow 22`
`sudo ufw allow 22/tcp`
## enable ufw
`sudo ufw enable`
## check fw status verbosely
`sudo ufw status verbose`
## add client pc rule
`sudo ufw allow from 10.0.0.192 to any port 22`
## show rules in processing order
`sudo ufw status numbered`
## remove rule using index number
`sudo ufw delete 1`
`sudo ufw delete rule_spec`
## add rule for ip range
`sudo ufw allow from 10.0.0.0/24 to any port 22`
## add rule for ip range for all ports
`sudo ufw allow from 10.0.0.0/24`
## add rule in specific position
`sudo ufw insert 1 deny from 10.0.0.37`
## block outbound traffic from network interface
`sudo ufw deny out on enp0s3 to 8.8.8.8`
## complex ufw inbound command
`sudo ufw allow in on enp0s3 from 10.0.0.192 to 10.0.0.100 proto tcp`
## complex ufw outbound command
`sudo ufw allow out on enp0s3 from 10.0.0.100 to 10.0.0.192 proto tcp`

# IPTABLES Firewall - INPUT CHAIN (incoming traffic rules), OUTPUT CHAIN (outgoing traffic rules), FORWARD CHAIN (forwarding for router type traffic)
## install on Ubuntu, should be installed by default on redhat or centos systems
`sudo apt install iptables`
## list default rules
`iptables -L`
## list rules in specific chain
`iptables -L chain_name`
## list rules in specific chain with line numbers
`sudo iptables -L INPUT --line-numbers`
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
## make rules persistent (APT system)
```
sudo apt-get install iptables-persistent -y
sudo netfilter-persistent save
sudo netfilter-persistent reload

```
## make rules persistent (service iptable)
```
sudo service iptables save
sudo service iptables restart

```

# Firewalld
## list active zones
`firewall-cmd --get-active-zones`
## set default zone to public 
`firewall-cmd --set-default-zone=public`
## add rule to zone
`sudo firewall-cmd --zone=public --add-port=3003/tcp --permanent`
## reload firewall
`firewall-cmd --reload`
## list rules in zone
`firewall-cmd --zone=public --list-ports`
## test connection
`ss -tuln | grep 3003`

# port redirection
## enable ip forwarding - edit file with "│net.ipv4.ip_forward=1"
`/etc/sysctl.conf`
### or create new config file with "│net.ipv4.ip_forward=1" setting
`/etc/sysctl.d/99-sysctl.conf`
## apply changes
`sysctl -p`
## create redirect rule
`sudo iptables -t nat -A PREROUTING -i enp1s0 -s 10.0.0.0/24 -p tcp --dport 8080 -j DNAT --to-destination 192.168.0.5:80`
## activate masquerading
`sudo iptable -t nat -A POSTROUTING - 10.0.0.0/24 -o enp6s0 -j MASQUERADE`
## view converted rules in nft
`sudo nft list ruleset`
## make rules persistant
`sudo apt install iptables-persistent`
## save rules
`sudo netfilter-persistent save`
## list NAT rules
`sudo iptables --list-rules --table nat`
## empty NAT table
`sudo iptablles --flush --table nat`

# reverse proxies - NGINX
## install nginx
`sudo apt install nginx`
## edit configuration file
`sudo vim /etc/nginx/sites-available/proxy.conf`
`sudo vim /etc/nginx/proxy_params`
```
server {
    listen 80;
    location / {
        proxy_pass http://1.1.1.1:8081;
        include proxy_params;
    }
}
```
## soft link configuration to activate
`sudo ln -s /etc/nginx/sites-available/proxy.conf /etc/nginx/sites-enabled/proxy.conf`
## disable built in website config
`sudo rm /etc/nginx/sites-enabled/default`
## check config files for error
`sudo nginx -t`
## reload service to apply
`sudo systemctl reload nginx.service`

# Creating a Load Balancer
## remove old config 
`sudo rm /etc/nginx/sites-enabled/proxy.conf`
## create new config file
`/etc/nginx/sites-available/lb.conf`
```
upstream mywebservers {
    least_conn;
    server 1.2.3.4 weight=3 down;
    server 5.6.7.8;
}
    server {
        listen 80;
        location / {
            proxy_pass http://mywebservers;
        }
    }
```
```
upstream mywebservers {
    least_conn;
    server 1.2.3.4:8081;
    server 5.6.7.8;
    server 10.20.3.40 backup;
}
    server {
        listen 80;
        location / {
            proxy_pass http://mywebservers;
        }
    }
```
`sudo ln -s /etc/nginx/sites-available/lb.conf /etc/nginx/sites-enabled/lb.conf`
## disable built in website config
`sudo rm /etc/nginx/sites-enabled/default`
## check config files for error
`sudo nginx -t`
## reload service to apply
`sudo systemctl reload nginx.service`



