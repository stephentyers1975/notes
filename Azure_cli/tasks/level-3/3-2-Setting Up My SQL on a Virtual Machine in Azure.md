# Setting Up My SQL on a Virtual Machine in Azure
The Nautilus DevOps team is tasked with integrating a PHP application hosted on an Azure VM with a MySQL database hosted on another Azure VM. This will validate the application's ability to connect to the database in the cloud.

Create the MySQL VM:

Create a VM named nautilus-mysql-vm using the MySQL Jetware image from the Azure Marketplace.
Configure the VM in the East US region.
Use Password as the authentication type.
Set the username as nautilus_admin and the password as Namin@123456.
Allow inbound traffic on port 3306 to enable MySQL access.
Setup the MySQL Database:
* created in portal
* nsg configured

SSH into the nautilus-mysql-vm.
Use the sudo /jet/enter mysql command to access the MySQL shell.
Create a database named nautilus_db.
Create a MySQL user named nautilus_user with password password123.
Grant all privileges on the nautilus_db database to this user.
PHP VM Setup:
`sudo /jet/enter mysql`
`CREATE DATABASE nautilus_db;`
`CREATE USER 'nautilus_user'@'%' IDENTIFIED BY 'password123';`
`GRANT ALL PRIVILEGES ON nautilus_db.* TO 'nautilus_user'@'%';`
`FLUSH PRIVILEGES;`
`exit;`

A VM named nautilus-php-vm already exists in the East US region.
This VM is hosting a PHP application and contains a pre-existing db_test.php file in the /var/www/html/ directory.
Database Connection Configuration:

Retrieve the public IP address of the nautilus-mysql-vm.
Update the database connection settings in the db_test.php file to use the MySQL credentials and public IP address of the nautilus-mysql-vm.
Validation:
* ssh into machine and eited php file

Access the db_test.php file from the nautilus-php-vm using its public IP address.
Ensure the file displays the message Connected successfully, confirming the connection between the PHP application and the MySQL database.