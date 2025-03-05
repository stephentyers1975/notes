# Write a Docker Compose File
The Nautilus application development team shared static website content that needs to be hosted on the httpd web server using a containerised platform. The team has shared details with the DevOps team, and we need to set up an environment according to those guidelines. Below are the details:

a. On App Server 3 in Stratos DC create a container named httpd using a docker compose file /opt/docker/docker-compose.yml (please use the exact name for file).

b. Use httpd (preferably latest tag) image for container and make sure container is named as httpd; you can use any name for service.

c. Map 80 number port of container with port 3001 of docker host

## create compose file
```
services:
  httpd:
    container_name: httpd
    image: httpd:latest
    ports:
      - 3001:80
    volumes:
      - /opt/devops:/opt/devops
```
## start container
`docker compose up -d`