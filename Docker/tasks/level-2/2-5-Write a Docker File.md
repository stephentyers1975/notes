# Write a Docker File
 create a docker file /opt/docker/Dockerfile (please keep D capital of Dockerfile) on App server 2 in Stratos DC and configure to build an image with the following requirements:

a. Use ubuntu as the base image.

b. Install apache2 and configure it to work on 8087 port. (do not update any other Apache configuration settings like document root etc).

## create docker files
```
# Use ubuntu as the base image
FROM ubuntu:latest

# Update and install apache2
RUN apt-get update && \
    apt-get install -y apache2

# Configure apache2 to work on port 8087
RUN sed -i 's/80/8087/g' /etc/apache2/ports.conf
RUN sed -i 's/*:80/*:8087/g' /etc/apache2/sites-available/000-default.conf

# Expose the port
EXPOSE 8087

# Start apache2 service
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
```
## build image
`docker build /opt/docker/Dockerfile`