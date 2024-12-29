## show username
`whoami`
## show uid
`id`
## switch user
`su username`
## switch to user
`sudo -iu username`
## run command as root 
`sudo ls /root`
## switch to root using account password
`sudo -i`
### or
`sudo --login`
## login as root using root password
`su -`
### or
`su -l`
### or 
`su --login`
## set root password
`sudo passwd root`
## unlock root account
`sudo passwd --unlock root`
### or
`sudo passwd -u root`
## lock root account
`sudo passwd --lock root`
### or
`sudo passwd -l root`
## sudoers file for adding super user
`/etc/sudoers`
## edit sudoers
`visudo`
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
### or
`sudo adduser user_name`
### specify different options
`sudo adduser --shell /bin/othershell --home /home/otherdir user_name`
## manually specify ID
`sudo adduser --uid 1005 user_id`
## example add user
`useradd -u 1009 -g 1009 -d /home/robert -s /bin/bash -c "Mercury Project Member" bob`
## create system account - UID usually < 1000
`sudo adduser --system --no-create-home sys_acc__name`
## set password
`passwd user_name`
## check user id detail and fields
`id user_name`
## delete a user
`userdel user_name`
### or
`sudo deluser user_name`
### remove home dir
`sudo deluser --remove-home user_name`
### or
`sudo userdel --remove username`
`sudo userdel -r username`
## add user to group specifying custom gid
`groupadd -g 1011 group_name`
## add user to a group with append(important)
`sudo usermod -a -G groupName userName`
## change user login
`sudo usermod --login old_username new_username`
### or
`sudo usermod -l old_username new_username`
## change user shell
`sudo usermod -s /bin/sh test_user`
## change user home dir
`sudo usermod -d /home/$USERNAME test_user`
## change user home dir and move it
`sudo usermod --home /home/$USERNAME --move-home test_user`
### or
`sudo usermod -d /home/$USERNAME -m test_user`
## lock account without deletion
`sudo usermod --lock username`
### or
`sudo usermod -L username`
## unlock account without deletion
`sudo usermod --unlock username`
### or
`sudo usermod -U username`
## set expiry date for account
`sudo usermod --expiredate 2028-12-01 username`
### or
`sudo usermod -e 2028-12-01 username`
## remove expiration date
`sudo usermod -e "" username`
## or
`sudo usermod --expiredate -1 username`
## expire password on account
`sudo chage --lastday 0 username`
### or
`sudo chage -d 0 username`
## unexpire password on account
`sudo chage --lastday -1 username`
### or
`sudo chage -d -1 username`
## make password expire every 30 days on account
`sudo chage --maxdays 30 username`
### or
`sudo chage -M -1 username`
## make password never expire 
`sudo chage --maxdays -1 username`
### or
`sudo chage -M -1 username`
## view when account expires
`sudo chage --list username`
### or
`sudo chage -l username`
## change warning days before password expires
`sudo chage --warndays 2 jane`
## delete group
`groupdel group_name`

# Groups
## add group
`sudo groupadd developers`
## add user to group
`sudo gpasswd --add john developers`
### or
`sudo gpasswd --a john developers`
## view group memebership
`groups john`
## remove user to group
`sudo gpasswd --delete john developers`
### or
`sudo gpasswd --d john developers`
## change users primary group
`sudo usermod -g developers john`
### or
`sudo usermod --gid developers john`
## rename a group
`sudo groupmod --new-name programmers developers`
### or
`sudo groupmod -n programmers developers`
## delete a grouo
`groupdel programmers`
## create user and add to different primary group and set UID for user
`sudo useradd -G group_name user_name --uid 5322`

