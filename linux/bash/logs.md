# System logs

## Type
* info
* warning
* err
* crit

## Priority levels
* alert
* crit
* debug
* emerg
* err
* info
* notice
* warning

## RSYSLOG - rocketfast system for log processing
`/var/log`
## authorisation logs - secure authentication/authorisation
`less /var/log/auth.log`
## system logs
`/var/log/syslog`
## view logs in realtime
`tail -F /var/log/auth.log`
## view all logs collected by journal daemon - > key moves to end of output
`journalctl`
## view all logs collected by journal daemon and go directly to the end of the output
`journalctl -e`
## view all logs collected by journal daemon in follow mode
`journalctl -f`
## view logs with journalctl
`journalctl /bin/sudo`
## view logs of service
`journalctl -u ssh.service`
`sudo journalctl --unit=ssh.service -n 20 --no-pager`
## view logs by priority
`journalctl -p err`
## view logs by priority and combine with grep option
`journalctl -p err -g '^b`
## view logs by priority and time since (24 hours)
`journalctl -S 02:00`
## view logs by priority and time since and until (24 hours)
`journalctl -S 02:00 -U 06:00`
## view logs by priority and time since (Date and 24 hours)
`journalctl -S 2024-03-03 01:00:30`
## view logs since current boot
`journalctl -b 0`
## view logs since previous boot
`journalctl -b -1`
## create journal directory
`sudo mkdir /var/log/journal`
## see who logged into the system
`last`
## see when user last logged into the system
`lastlog`
## search log files recursively for certain text
`sudo grep -r --text 'reboot' /var/log/ > reboot.log`