# Kernel parameters
## see all kernel runtime parameters in use
`sysctl -a`
## set value of kernel parameter (non-persistant)
`sysctl -w net.mptcp.allow_join_initial_addr_port=1`
## check current value of parameter
`sysctl net.mptcp.allow_join_initial_addr_port`
## filter for memory settings
`sysctl -a | grep 'vm'`
* vm.swapiness is a common setting -> 0 - 100 on older kernels, 0 - 200 on newer kernels
## make changes persistant
* add .conf file to /etc/sysctl.d/ directory -> recommended method for custom kernel settings
* check man sysctl.d
* name file something meaningful -> swap-less.conf
* list setting(s) in file gathered from sysctl -a command
* settings will apply on reboot
* to force immediately run -> sudo systemctl -p /etc/sysctl.d/swap-less.conf
* another place to edit kernel settings in in /etc/sysctl.conf - can get overwritten by OS upgrade

# Selinux - Enabled by default on Redhat, not ubuntu
## view selinux permisions on directory listing
`ls -Z`

!["selinux context"](/images/selinux.png)


## view selinux permisions on processes
`ps -axZ`
## view security context applied to user
`id -Z`
## view regular user -> selinux user mapping
`sudo semanage login -l`
## view selinux roles assigned  
`sudo semanage user -l`
## check if selinux is actively enforcing security (enforcing, permissive, disabled)
`getenforce`

# Mandatory access control MAC with Selinux
## ubuntu enablement
### stop and disable app armor service
`sudo systemctl stop apparmor.service`
`sudo systemctl disable apparmor.service`
### install packages
`sudo apt install selinux-basics auditd`
### check selinux status
`sestatus`
### activate and enable selinux on system
`sudo selinux-activate`
### check settings added to bootloader
`cat /etc/default/grub`
### check root filesystem
`.autorelabel`
### look at selinux audit log to see what it has observed in permissive mode
`sudo audit2why --all | less`
## view selinux permisions on all processes
`sudo ps -eZ`
## create selinux rules on observed and logged actions
`sudo audit2allow --all -M mymodule`
## load rules
`sudo semodule -i mymodule.pp`
### enforce policy -temporary and resets to permissive on reboot
`sudo setenforce 1`
### permantly enforce
`/etc/selinux/config`
`SELinux status:                 disabled`
### view policy
`less mymodule.te`
### change context of user label on file
`sudo chcon -u unconfined_u filepath`
### change context of role label on file
`sudo chcon -r object_r filepath`
### change context of type label on file
`sudo chcon -t user_home_t filepath`
### show valid selinux label
`seinfo -u`
### show valid selinux roles
`seinfo -r`
### show valid selinux types
`seinfo -t`
### change type labels from template file
`sudo chcon --reference=/var/log/dmesg /var/log/auth.log`
### reset type label from best practice db
`sudo restorecon -R /var/www`
### reset all (user,type,role) label from best practice db
`sudo restorecon -F -R /var/www`
### view selinux roles for seunix users
`semanage user -l`
### add new file context defnition to db
`sudo semanage fcontext --add --type var_log_t /var/www/10`
### make persistant
`sudo restorecon /var/www/10`
### change default lables on entire directories and files within. Look at current expressions on directories
`sudo semanage fcontext --list`
`sudo semanage fcontext --add --type nfs_t "/nfs/shares(/.*)?"`
### list selinux supported booleans
`sudo semanage boolean --list`
### set selinux supported booleans
`sudo setsebool virt_use_nfs 1`
### check value of certain boolean
`sudo semanage  port --list`
### list port bindings
`sudo semanage port --list`
### customise port on binding
`sudo semanage port --add --type ssh_port_t --proto tcp 2222`
### delete port on binding
`sudo semanage port --delete --type ssh_port_t --proto tcp 2222`
