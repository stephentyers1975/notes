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
## another memory summary command -m = megagbyte, -g=gigabyte, k=kilobyte
`free -m`
