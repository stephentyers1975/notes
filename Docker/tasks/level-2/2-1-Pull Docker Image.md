# Pull Docker Image
Pull busybox:musl image on App Server 3 in Stratos DC and re-tag (create new tag) this image as busybox:blog
## pull image
`docker pull busybox:musl`
## retage image
`docker tag busybox:musl busybox:blog`