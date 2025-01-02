# System wide environment variables
## print environment variables
`env`
### or
`printenv`
## set variable
`VARNAME=value`
## users own environment file
`~/.bashrc`
## global user environment file- every user
`/etc/envrionment`
## directory to run scripts everytime user logs in - no need for shebang in .sh script
`/ect/profile.d/`
## user skeleton file - provides the default settings for a new user's home directory, copies files from this directory to the new users home dir
`/etc/skel`

# User resource limits
## limits file location
`/etc/security/limits.conf`
## user manual for limits
`man limits.conf`
## view limit for current session
`ulimit -a`
## raise or lower limits
`ulimit -u 5000`

# User privileges
## add user to sudo group
`sudo gpasswd -a sudo username`

# Timezones
## config file
`/etc/localtime`
## check timezone 
`timedatectl`
## list timezones available 
`timedatectl list-timezones`
## set timezones  -> alter symlink to /etc/localtime
`timedatectl set-timezone time_zone`

# Time services - NTP
## see available timezones
`timedatectl list-timezones`
## set timezone
`sudo timedatectl set-timezone America/Los_Angeles`
## check timezone
`timedatectl`
## install timesynce utility
`sudo apt install systemd-timesyncd`
## turn on syncronisation
`sudo timedatectl set-ntp true`
## check timesynce service
`systemctl status systemd-timesyncd.service`
## edit service configuration
`sudo vim /etc/systemd/timesyncd.conf`
## restart timesynce service
`systemctl restart systemd-timesyncd.service`
## check status
`sudo timedatectl show-timesync`