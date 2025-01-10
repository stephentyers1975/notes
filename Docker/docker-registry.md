# Docker Registry
## login to registry
`docker login private-registry.io`

# Deploy private registry
`docker run -d -p 5000:5000 --name registry registry:2`
## tag image to private registry
`docker image tag my-image localhost:5000/my-image`
## push image
`docker push localhost:5000/my-image`
## pull image
`docker pull localhost:5000/my-image`