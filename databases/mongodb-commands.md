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
## check log file listens on default port 27017
`/var/log/mongodbmongod.log`
## configuration file
`/etc/mongod.conf`
## connect to mongo shell
`mongo`
## list databases
`show dbs`
## use database or create
`use example_db`
## show currently selected db
`db`
## create collection
`db.createCollection("persons")`
## show collection
`show collections`
## insert data into collection
```
db.persons.insert({
    "name" : "john doe",
    "age" : 45,
    "location" : "new york",
    "salary" : 5000
})
```
## find collection
`db.persons.find()`
## find collection with filter
`db.persons.find({"name" : "john doe"})`
