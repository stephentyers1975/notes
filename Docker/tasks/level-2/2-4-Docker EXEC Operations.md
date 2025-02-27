# Docker EXEC Operations
a. Install apache2 in kkloud container using apt that is running on App Server 2 in Stratos Datacenter.


b. Configure Apache to listen on port 8084 instead of default http port. Do not bind it to listen on specific IP or hostname only, i.e it should listen on localhost, 127.0.0.1, container ip, etc.


c. Make sure Apache service is up and running inside the container. Keep the container in running state at the end.


`apt update`
`apt upgrade`
`apt install apache2`
`service apache2 start`
`apt install vim -y`
`vim /etc/apache2/ports.conf`
* changed Listen 80 to Listen 8084
`vim /etc/apache2/sites-available/000-default.conf`
* changed <VirtualHost *:80> to <VirtualHost *:8084>
`service apache2 restart`
* verified with netstat
`apt instal net-tools`
`netstat -tuln | grep 8084`