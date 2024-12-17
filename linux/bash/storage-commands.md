# Storage Commands
## Disk Partitions
### list bloc devices
`lsblk`
### list bloc devices
`ls -l /dev/ | grep "^b"`
### list partitions
`fdisk -l /dev/sda`
## Partition types
* Primary - used to boot OS
* Extended - can't be used on its own and used in addition to other partitions and can be carved out into logical partitions
* logical - created within an extended partition
## Partition scheme
* MBR -> master boot record ->  max 4 primary partitions and max 2tb per partitions
* GPT -> GUID partition table -> unlimited partitions, no max size
## Create partition on disk with gdisk (menu driven)
`gdisk /dev/sdb`
### list help
`?`
### new partition
`n`
### delete partition
`d`
### write partition
`w`
### size partition
`+550M`
### list
`gdisk -l`

# Create Filesystems
![linux filesysystem](/images/linux_filesystem.png)
## create ext4 file system
`mkfs.ext4 /dev/sdb1`
## mount filesystem
`mkdir /mnt/ext4`
`mount /dev/sdb1 /mnt/ext4`
## check mounted filesystem
`mount | grep /dev/sdb1`
`df -hP | grep /dev/sdb1`
## check filesystem type
`sudo blkid /dev/vdc`
## make mounts permanent
`/etc/fstab`

![linux filesysystem](/images/fstab.png)
## echo config into fstab
`echo "/dev/sdb1 /mnt/ext4 ext4 rw 0 0" >> /etc/fstab`

# DAS, NAS and SAN

 * DAS -> directly attached block storage
 * NAS -> network file system presented via NFS/CIFS/SMB shares over LAN
 * SAN -> fibre channel (via HBA) /ISCSI (via Ethernet NIC) attached enterprise block storage

 ## NFS config
 `/etc/exports`
 ![linux filesysystem](/images/nfs.png)
 ## export everything in confi file to clients
 `exportfs -a`
 ## export a single folder
 `exportfs -o hostname:/path_to_folder`
 ## mount shared folder locally on client with moutn
 `mount hostname:/path_to_folder /mnt/software/repos`

 ## Logical Volume Manager LVM
 ## install lvm2
 `apt install lvm2`
 ## step 1 create physical volume (PV) from physical disk
 `pvcreate /dev/sdb`
 ## list details of all PV's
 `pvdisplay`
 ## step 2 create volume group
 `vgcreate example_vg /dev/sdb`
  ## list details of all VG's
 `vgdisplay`
 ## step 3 create logical volumes from volume group
 `lvcreate -L 1G -n vol1 example_vg`
 ## list logical volumse
 `lgdisplay`
 ### or use lvs for summary of logical volume, volume group membership and capacity
 `lvs`
 ## step 5 create filesystem on volume
 `mkfs.ext4 /dev/example_vg/vol1`
 ## step 6 mount filesystem
 `mount -t ext4 /dev/example_vg/vol1 /mnt/vol1`

 ## resize logical volume
 ### check size of volume group first
 `vgs`
 ### Resize command for logical volume
 `lvresize -L +1G -n /dev/example_vg/vol1`
 ### Resize filesystem
 `resize2fs /dev/example_vg/vol1`

 ![logical volume](/images/logicalvolume.png)