## show username
`whoami`
## show uid
`id`
## switch user
`su username`
## run command as root 
`sudo ls /root`
## switch to root
`sudo -i`
## sudoers file for adding super user
`/etc/sudoers`
## prefered location to above sudoers file for super user permissions
`/etc/sudoers.d/`  
## Example creation of super user permissions using sudoers.d directory
### create new user
`sudo useradd newuser`  
### set password
`sudo passwd newuser`  
### create new file for user account in sudoers.d directory
`sudo visudo -f /etc/sudoers.d/newuser`  
### add below into new file
`newuser ALL=(ALL) ALL`  
### change file permissions of new file to lock down
`sudo chmod 440 /etc/sudoers.d/newuser`
