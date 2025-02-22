# Default GUI Boot Configuration
Adjust the default runlevel on all App servers in Stratos Datacenter to enable GUI booting by default. It's imperative not to initiate a server reboot after completing this task.
`systemctl set-default graphical.target`