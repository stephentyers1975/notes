# Working with hardware - Kernel Space(device driver) -> uevents -> device(e.g USB) -> User Space(udev) -> /dev/sdb1
## Displays messages from ring buffer, userful for hardware related messages
`dmesg` | grep -i 'usb'
## query udev info for a device
`udevadm info --query=path --name=/dev/sda5`
## print and display received events for udev - handy for getting details of newly attached/dettached device
`udevadm monitor`
## lists PCI hardware devices
`lspci`
## list bloc devices
`lsblk`
## display information about cpu
`lscpu`
## display memory information
`lsmem`
### or
`lsmem --sumarry`
## another memory summary command -m= megagbyte, -g=gigabyte, -k=kilobyte
`free -m`
## list entire hardware configuration
`lshw`

# Boot Process -> BIOS POST -> Bott Loader(GRUB2 1st sector of HD /bootfile) -> Kernel Initilization -> INIT Process(SYSTEMD)
## check init system that used - systemd or system5
`ls -l /sbin/init`
## check run level 3=cmdline -> systemd(multiuser.target) 5=gui -> systemd(graphical.target)
`runlevel`
# check and change systemd run target
## check default run target
`systemctl get-default`
### and
`ls -ltr /etc/systemd/system/default.target`
## change default taregt
`systemctl set-default multi-user.target`
### run target list
* runlevel 0 -> poweroff.target
* runlevel 1 -> rescue.target
* runlevel 2 -> multi-user.target
* runlevel 3 -> multi-user.target
* runlevel 4 -> multi-user.target
* runlevel 5 -> graphical.target
* runlevel 6 -> reboot.target