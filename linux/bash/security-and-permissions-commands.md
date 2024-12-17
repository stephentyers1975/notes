# Security commands

# User Accounts
![linux accounts](/images/linux_accounts.png)
## user account UID and info configuration file
`/etc/passwd`
## group GID and info configuration file
`/etc/group`
## check user uid, primary group and groups
`id username`
## check home dir and default shell of user
`grep -i username /etc/passwd`
## account types
![linux accounts](/images/account_type.png)
## display logged in users
`who`
## display record of historically logged in users with date and time since reboot
`last`
## switch user to root(not recommended)
`su -`
## default sudeors file
`/etc/sudoers`
## edit sudoers file
`visudo`
## disable root user login entry in /etc/passwd file
`/root:x:0:0:root:/root:/usr/sbin/nologin`
## sudo file entry structure
![linux accounts](/images/sudo.png)

# Access Control Files

![linux accounts](/images/access_control_files.png)

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