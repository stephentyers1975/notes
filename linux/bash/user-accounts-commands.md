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

# Access control files
![linux accounts](/images/access_control_files.png)
## username:password:uid:primarygid:GCOS:homedir:shell
`/etc/passwd`
## passwords hashed - USERNAME:PASSWORD:LASTCHANGE:MINAGE:MAXAGE:WARN:INACTIVE:EXDATE
`/etc/shadow`
## groups - NAME:PASSWORD:GID:MEMBERS
`/etc/group`

# Manage user accounts
## add user
`useradd user_name`
## example add user
`useradd -u 1009 -g 1009 -d /home/robert -d /bin/bash -c "Mercury Project Member" bob`
## set password
`passwd user_name`
## check user id detail and fields
`id user_name`
## delete a user
`userdel user_name`
## add user to group specifying custom gid
`groupadd -g 1011 group_name`
## add user to a group with append(important)
`sudo usermod -a -G groupName userName`
## change user shell
`sudo usermod -s /bin/sh test_user`
## change user home dir
`sudo usermod -d /home/$USERNAME test_user`
## delete group
`groupdel group_name`

month_input=$1
1=January
if [ -z $month_input ]
then
        echo "No month given"
        exit
fi

if [ $month_input -gt 0 && $month_input -lt 13 ]
then
        echo "correct month"
else
        echo "Invalid month number given"
fi