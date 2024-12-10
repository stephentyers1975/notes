## download rpm
`wget https://dev.mysql.com/get/mysql80-community-release-el7-3.noarch.rpm `
## install package and extract repositories
`rpm -ivh mysql80-community-release-el7-3.noarch.rpm`
## install with yum
`yum install mysql-server `
## start service
`service mysqld start`
## check status of service
`service mysqld status`
## validate and shows default port of 3306, temporary password is also in this log file
`cat /var/log/mysqld.log`
## connect to DB with root and temp password
`mysql –u root -pg/io%pFlE77m`
## change root password
`ALTER USER 'root'@'localhost' IDENTIFIED BY 'MyNewPass4!';`
## show all databases
`SHOW DATABASES;`
## create database
`CREATE DATABASE school;`
## use database school
`USE school;`
## create table in school
``` 
CREATE TABLE persons
(
Name varchar(255),
Age int,
Location varchar(255)
);
```
## show tables
`SHOW TABLES;`
## insert into table
```
INSERT INTO persons values
( "John Doe", 45, "New York");
```
## select all records from table
`SELECT * FROM persons;`
## create user
### localhost or specific system
`CREATE USER 'john'@'localhost' IDENTIFIED BY 'MyNewPass4!';`  
`CREATE USER 'john'@'192.168.1.10' IDENTIFIED BY 'MyNewPass4!';`
### all systems
`CREATE USER 'john'@'%' IDENTIFIED BY 'MyNewPass4!';`
## grant privileges
`GRANT SElECT ON school.persons TO 'john'@'%';`  
`GRANT SElECT, UPDATE ON school.persons TO 'john'@'%';`  
`GRANT SElECT, UPDATE ON school.* TO 'john'@'%';`   
`GRANT ALL PRIVILEGES ON *.* TO 'john'@'%';`
## show privileges 
`SHOW GRANTS FOR 'john'@'localhost';`
## privilege table
- ALL PRIVILEGES
- CREATE
- DROP
- DELETE
- INSERT
- SELECT
- UPDATE
