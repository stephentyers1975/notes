# Docker Commands
## docker run - run a container from an image - attached mode - image is pulled from hub if it doesn't exist locally
`docker run nginx`
## docker run - run a container from an image - detached mode
`docker run -d nginx`
## reattach to container
`docker attach container-id`
## show running containers
`docker ps`
## show all containers running and stopped
`docker ps -a`
## show full details for container - reutrns in JSON
`docker inspect container_name/ID`
## show container logs
`docker logs container_name/ID`
## stop a container
`docker stop container_name/ID`
## remove a container
`docker rm container_name/ID`
## list images on host
`docker images`
## remove a image
`docker rmi image_name`
## download image from hub/registry
`docker pull image_name:tag`
## append a command on a container - command executes and container exits
`docker run ubuntu sleep 200`
## execute a command on a running container
`docker exec container_name command`
## run container in interactive mode
`docker run -i centos bash`
## run container with interactive terminal
`docker run -it centos bash`

# Mapped port
## run container with mapped port
`docker run -p 80:8080 nginx`

# Custom name
## run container with custom name
`docker run -p 80:8080 --name custom_name nginx`

# Persisting Data
## map host directory to container directory
`docker run -v /opt/datadir:/var/lib/mysql mysql`

# Create your own image
## Build image from Dockerfile locally command
`docker build -t registry_name/my-custom-app-image Dockerfile`
## login to registry
`docker login`
## Push built image to registry command
`docker push registry_name/my-custom-app-image`
## view build history of image
`docker history registry_name/my-custom-app-image`

# Environment variables
## inject environment variable at run
`docker run -e APP_COLOR=blue image_name`
## inspect environment variables on running container
`docker inspect container_name/ID`
