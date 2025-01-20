# Expanding and Managing Disk Storage

## Expand the existing VM devops-vm disk from 32Gi to 64Gi
### 1 - deallocate vm
`az vm deallocate --resource-group kml_rg_main-2d51a119c1874241 --name devops-vm`
### 2 - resize disk
`az disk update --name devops-vm_disk1_1332469979bc493e931dba3d29932f15 --resource-group kml_rg_main-2d51a119c1874241 --size-gb 64`
### 3 - restart vm
`az vm start --resource-group kml_rg_main-2d51a119c1874241 --name devops-vm`

## Create a new standard HDD data disk named devops-disk of 64Gi and mount the disk to VM devops-vm at location /mnt/devops-disk
### 1 - create new disk
`az disk create --resource-group kml_rg_main-2d51a119c1874241 --size 64 --sku Standard_LRS --name devops-disk`
### attach disk to vm
`az vm disk attach --resource-group kml_rg_main-2d51a119c1874241 --vm-name devops-vm --name devops-disk`
### create disk partion
`gdisk /dev/sdc`
### create filesystem
`mkfs.ext4 /dev/sdc1`
### mount disk 
`/dev/sdc1 /mnt/devops-disk`
### make mount permenant 
`echo '/dev/sdc1 /mnt/devops-disk ext4 defaults,nofail 0 2' | sudo tee -a /etc/fstab`