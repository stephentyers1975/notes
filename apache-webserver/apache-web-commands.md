## install with yum
`yum install httpd`
## start service
`service httpd start` or `systemctl start httpd`
## check status
`service httpd status` or `systemctl status httpd`
## enable firewall port
`firewall-cmd --permanent --add-service=http`
## view access logs
`cat /var/log/httpd/access_log`
## view error logs
`cat /var/log/httpd/error_log`
## edit config file
`vi /etc/httpd/conf/httpd.conf`
## restart service after confi changes
`service httpd restart`
## sample config file entries
`ServerName www.test.com:80`     
`Listen 80`  
`DocumentRoot "/var/www/html”`  
`Include conf/houses.conf`  
`Include conf/oranges.conf`  
## example houses.conf file for multi site hosting
`<VirtualHost *:80>  
    ServerName www.houses.com   
    DocumentRoot /var/www/houses  
</VirtualHost>`