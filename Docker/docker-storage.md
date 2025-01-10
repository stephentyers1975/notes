# Docker storage
## folder structure
`/var/lib/docker/auf`
`/var/lib/docker/containers`
`/var/lib/docker/image`
`/var/lib/docker/volumes`
## create persistent volume -> created in folder /var/lib/docker/volumes/
`docker volume create data_volume`
## mount data (volume mount) to container -> if persistent volume isn't created, it will be created in default location
`docker run -v data_volume:/var/lib/mysql mysql`
## mount data (BIND mount - any folder) to container in alternative folder location to default /var/lib/docker/volumes
`docker run -v /data/mysql:/var/lib/mysql mysql`
## new mount syntax
`docker run --mount type=bind,source=/data/sql,target=/var/lib/mysql mysql`
## list persistent volumes
`docker volume ls`
## detailed volume query
`docker volume inspect <volume_name>`

# Storage Drivers
* AUFS
* ZFS
* BTRFS
* Device Mapper
* Overlay
* Overlay2
