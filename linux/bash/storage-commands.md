# Storage Commands
## Disk Partitions
### list bloc devices - disks, partitions, lvm
`lsblk`
### directory
`/dev/`
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

# cfdisk util - gui style
## inspect storage device
`sudo cfdisk /dev/sdb/`

# configure and manage swap space - you have multiple swap partitions/files
## check if swap is used
`swapon --show`
## check for free swap partition available
`lsblk`
## format swap partition
`sudo mkswap /dev/vdb3`
## check new formatted partition
`swapon --verbose /dev/vdb3`
## stop using partition as swap space
`sudo swapoff /dev/vdb3`
## setup swap on file instead of partition
`sudo dd if=/dev/zero of=/swap bs=1M count=128`
## setup swap on file instead of partition with build progress
`sudo dd if=/dev/zero of=/swap bs=1M count=128 status=progress`
## set permission of swap file
`sudo chmod 600 /swap`
## format swap file
`sudo mkswap /swap`


# Create Filesystems
* redhat XFS
* Ubuntu EXT4
![linux filesysystem](/images/linux_filesystem.png)
## read manual ext4
`man mkfs.ext4`
## create ext4 file system
`mkfs.ext4 /dev/sdb1`
## create ext4 file system with custom inode size forced
`mkfs.ext4 -N 500000 /dev/sdb1`
## display properties of current ext4 filesystem
`sudo tune2fs -l /dev/sdb2`
## change label of current ext4 filesystem
`sudo tune2fs -L "secondFS" /dev/sdb2`
## create xfs file system
`mkfs.xfs /dev/sdb1`
## read manual xfs
`man mkfs.xfs`
## create xfs file system with label
`mkfs.xfs -L "backup volume" /dev/sdb1`
## create xfs file system with custom inode size forced
`mkfs.xfs -f -i size=512 /dev/sdb1`
## xfs_ utils - display label
`sudo xfs_admin -l /dev/sdb1`
## xfs_ utils - change label
`sudo xfs_admin -L "firstlfs" /dev/sdb1`


## mount filesystem
`mkdir /mnt/ext4`
`mount /dev/sdb1 /mnt/ext4`
## unmount filesystem
`umount /mnt/ext4`
## check mounted filesystem
`mount | grep /dev/sdb1`
`df -hP | grep /dev/sdb1`
## check filesystem type
`sudo blkid /dev/vdc`
## make mounts permanent
`/etc/fstab`
## fstab manual
`man fstab`
### example entries
`/dev/vda2  /boot       ext4    defaults    0 1`
`/dev/vda1  /mybackups       xfs    defaults    0 2`
`/dev/vda2  /mybackups       ext4    defaults    0 2`
`/dev/vda3  none       swap    defaults    0 0`
`UUID=ec7778797973  /boot       ext4    defaults    0 1`
`UUID=ec7778797973  /boot       ext4    ro,noexec    0 2`
## use UUID of device
`sudo blkid /dev/vdb1`

# Filesystem mount options
## show all mounted filesystems including memory
`findmnt`
## show only real file systems currently mounted
`findmnt -t xfs, ext4`
## mount read only file system
`sudo mount -o ro /dev/vdb2 /mnt`
## mount read only, no exec,no disables suid permissions file system
`sudo mount -o ro,noexec,nosuid /dev/vdb2 /mnt`
## remount read/write, no exec,no disables suid permissions file system
`sudo mount -o remount rw,noexec,nosuid /mnt`

![linux filesysystem](/images/fstab.png)
## echo config into fstab
`echo "/dev/sdb1 /mnt/ext4 ext4 rw 0 0" >> /etc/fstab`

# DAS, NAS and SAN

 * DAS -> directly attached block storage
 * NAS -> network file system presented via NFS/CIFS/SMB shares over LAN
 * SAN -> fibre channel (via HBA) /ISCSI (via Ethernet NIC) attached enterprise block storage

# NFS server
## install NFS server
`sudo apt install nfs-kernel-server`
## config file for shares
`/etc/exports`
## example entry in exports file
`/srv/homes     hostname1(rw,sync,no_subtree_check) hostname2(ro,sync,no_subtree_check)`
### host options
* example.com or server1.example.com or *.example.com
* 10.0.0.9
* 10.0.16.0/24
!["nfs options"](/images/nfs_options.png)
## view exports manual
`man exports`
## apply nfs changes
`sudo exportfs -r`
## view currently exported nfs shares
`sudo exportfs -v`

# NFS client
## install NFS client
`sudo apt install nfs-common`
## mount nfs share
`sudo mount IP_or_hostname:/path/to/remote/directory /path/to/local/directory`
## mount permantly
`/etc/fstab`
`ip_address:/folder_path nfs defaults 0 0`

## NFS config
`/etc/exports`
![linux filesysystem](/images/nfs.png)
## export everything in config file to clients
`exportfs -a`
## export a single folder
`exportfs -o hostname:/path_to_folder`
## mount shared folder locally on client with mount
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