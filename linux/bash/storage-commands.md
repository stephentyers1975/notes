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
![linux filesysystem](/images/linux_filesystem.png)
## echo config into fstab
`echo "/dev/sdb1 /mnt/ext4 ext4 rw 0 0" >> /etc/fstab`


 