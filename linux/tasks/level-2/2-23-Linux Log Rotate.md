# Linux Log Rotate
In all app servers install tomcat package.

b. Using logrotate configure tomcat logs rotation to monthly and keep only 3 rotated logs.

## update system
`yum update`
## install tomcat
`yum install tomcat -y`
## start and enable services
`systemctl enable --now tomcat`
## create log rotatation
`sudo vi /etc/logrotate.d/tomcat`
```
/var/log/tomcat/*.log {
    monthly
    rotate 3
    compress
    missingok
    notifempty
    create 0640 tomcat tomcat
}
```
## test log rotate
`sudo logrotate -d /etc/logrotate.d/tomcat`