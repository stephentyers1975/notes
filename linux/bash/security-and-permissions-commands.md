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

