# working with azure container registry
1) Create a ACR repository named devopsacr28443 under East US.

2) Pricing plan must be Basic.

3) Dockerfile already exists under /root/pyapp directory on azure-client host.

4) Build a Docker image using this Dockerfile and push the same to the newly created ACR repo. The image tag must be latest i.e devopsacr28443:latest.

## create registry
`az acr create --resource-group myResourceGroup --name devopsacr28443 --sku Basic --location eastus`
## login to registry
`az acr login --name devopsacr28443`
## build docker image
`docker build -t nautilusacr3629:latest /root/pyapp/.`
## tage image with azure registry
`docker tag nautilusacr3629:latest nautilusacr3629.azurecr.io/nautilusacr3629:latest`
## push to registry
`docker push nautilusacr3629.azurecr.io/nautilusacr3629:latest`