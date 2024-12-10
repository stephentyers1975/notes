# Install on CENTOS
## create repo file
`Create a /etc/yum.repos.d/mongodb-org-8.0.repo`  
```
[mongodb-org-8.0]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/9/mongodb-org/8.0/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://pgp.mongodb.com/server-8.0.asc
```
## install with yum
`yum install mongodb-org`
## start service
`systemctl start mongod`
## check status service
`systemctl status mongod`
