# Docker
## view commands
`docker --help`
## search for image on docker hub
`docker search nginx`
## pull docker image from registry
`docker pull nginx`
## pull docker image specific version from registry
`docker pull nginx:1.22.1`
## list docker images stored
`docker images`
## remove docker image
`docker rmi image_name/id`
### or specific tag version
`docker rmi image_name:tag`
## run container
`docker run nginx`
## run container detached
`docker -d -p 8080:80 --name my_nginx run nginx`
## list running containers
`docker ps`
## list all containers - running and stopped
`docker ps -a`
## start a container
`docker start container_id/name`
## stop a container
`docker stop container_id/name`
