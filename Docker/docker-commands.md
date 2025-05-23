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
## forcefully remove a running container
`docker rm -f container_name/ID`
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
## returns information for the container such as percentage CPU usage, percentage memory usage, I/O written to disk, network data sent and received, and process IDs assigned.
`docker stats container_name`

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
`docker build -t registry_name/my-custom-app-image .`
## login to registry
`docker login`
## Push built image to registry command
`docker push registry_name/my-custom-app-image`
## view build history of image
`docker history registry_name/my-custom-app-image`
## remove dangling images
`docker image prune -a`
## build image from running container
`docker commit container_id image_name:tag`

# Environment variables
## inject environment variable at run
`docker run -e APP_COLOR=blue image_name`
## inspect environment variables on running container
`docker inspect container_name/ID`

# Commands and Entry points in docker file
## executes when container in run and can get overidden by manual command added in the docker run command
`CMD sleep 5`
## Entrypoint - command thats run when container is started. Commands parameters added in docker run file are appended to entry point
`ENTRYPOINT["sleep"]`
# Used together
```
ENTRYPOINT["sleep"]
CMD['5']
```
## overide ENTRY POINT AND CMD in the command line
`docker run --entrypoint sleep2.0 ubuntu-sleeper 10`

## copy files between host and containers
`docker cp host_src container_name:dst_folder`

## create image from running container
`docker commit container_name image:tag`
