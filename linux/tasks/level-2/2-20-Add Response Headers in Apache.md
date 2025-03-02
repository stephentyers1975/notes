# Add Response Headers in Apache
We are working on hardening Apache web server on all app servers. As a part of this process we want to add some of the Apache response headers for security purpose. We are testing the settings one by one on all app servers. As per details mentioned below enable these headers for Apache:

Install httpd package on App Server 2 using yum and configure it to run on 8082 port, make sure to start its service.

Create an index.html file under Apache's default document root i.e /var/www/html and add below given content in it.

Welcome to the xFusionCorp Industries!

Configure Apache to enable below mentioned headers:

X-XSS-Protection header with value 1; mode=block

X-Frame-Options header with value SAMEORIGIN

X-Content-Type-Options header with value nosniff

## install httpd
`yum install -y httpd`
## start and enable service
`systemctl enable --now httpd`
## edit httpd conf file
`vi /etc/httpd/conf/httpd.conf`
```
Listen 8082
<IfModule mod_headers.c>
    Header set X-XSS-Protection "1; mode=block"
    Header set X-Frame-Options "SAMEORIGIN"
    Header set X-Content-Type-Options "nosniff"
</IfModule>
```