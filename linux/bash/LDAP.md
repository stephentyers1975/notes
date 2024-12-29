# LDAP
## create pre-built LDAP server
## initialise lxd virtual env
`lxd init`
## import ldap image
`lxc import ldap-server.tar.xz`
## list containers
`lxc list`
## start container
`lxc start ldap-server`
## configure server to use LDAP server with correct domain and elements
`sudo apt install libnss-ldapd`
## location of config files
`/etc/nslcd.conf`
## show LDAP and local users
`getent passwd`
## show LDAP users only
`getent passwd --service ldap`
## show LDAP groups only
`getent group --service ldap`
## use PAM's to create home dir
`sudo pam-auth-update`

