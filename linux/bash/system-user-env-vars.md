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