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
`docker run -d -p 8080:80 --name my_nginx run nginx`
## list running containers
`docker ps`
## list all containers - running and stopped
`docker ps -a`
## start a container
`docker start container_id/name`
## stop a container
`docker stop container_id/name`
* docker run command builds and starts a container from an image
* docker start purely starts and existing built container
## remove a container
`docker rm container_name/id`
## run container with always policy
`docker run -d -p 8080:80 --restart always --name my_nginx nginx `
## build custom image with Docker file
`docker build -t registry_name/image:tag .`

# virtualisation QEMU/KVM

## install virt manager
`sudo apt install virt-manager`
## download minimal cloud image
`wget url`
## preform checksum on image to verify with .gpg file
`sha256sums -c SHA256SUMS 2>&1 | grep OK`
## inspect image with QEMU util
`qemu-img info img_file`
## expand size of virtual disk
`qemu-img resize img_file 10G`
## default storage pool location
`/var/lib/libvirt/images`
## define vm from xml file
`virsh define /opt/testmachine2.xml`
## build vm
`virt-install --osinfo ubuntu24.04 --name ubuntu1 --memory 1024 --vcpus 1 --import --disk image_path --graphics none`
## build vm with cloud init script enabled
`virt-install --osinfo ubuntu24.04 --name ubuntu1 --memory 1024 --vcpus 1 --import --disk image_path --graphics none --cloud-init root-password-generate on`
## build vm with cloud init script enabled and detect os
`virt-install --osinfo detect=on --name ubuntu1 --memory 1024 --vcpus 1 --import --disk image_path --graphics none --cloud-init root-password-generate on`
## build vm with iso or url
`virt-install --osinfo debian12 --name debian1 --memory 1024 --vcpus 1 --import --disk size=10 --location iso_path or url --graphics none --cloud-init root-password-generate on --extra-args "console=ttyS0`
## exit from vm console
`ctrl + ]`
## re-attach to console
`virsh console vm_name`
## list all vms
`virsh list --all`
## start vm
`virsh start vm_name`
## shutdown vm
`virsh shutdown vm_name`
## remove vm from host
`virsh undefine vm_name --remove-all-storage`
## enable autostart on vm
`virsh autostart VM2`
## increase memory size for vm
`virsh setmaxmem VM2 80M --config`
`virsh setmem VM2 80M --config`

