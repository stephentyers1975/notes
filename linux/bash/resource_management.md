# resource managment
## check storage space
`df -h`
## check disk usage
`du -sh`
## check system memory
`free -h`
## check cpu usage - last 3 figures represent percentage cpu cores used
`uptime`
## show detailed cpud details
`lscpu`
## show other hardware
`lspci`
## verify file system (must unmount first)
### xfs
`sudo xfs_repair -v /dev/vdb1`
### ext4
`sudo fsck.ext4 -v -f -p /dev/vdb2`
## show important system dependencies
`systemctl list-dependencies`
## show detailed logs of service
`journalctl -u atd.service` 