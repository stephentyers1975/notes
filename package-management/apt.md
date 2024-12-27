# apt package manager
## update local available package databases
`sudo apt update`
## upgrade packages
`sudo apt upgrade`
## chain commands togethere
`sudo apt update && sudo apt upgrade`
## install package
`sudo apt install package_name`
## view files in package with DPKG
`dpkg --listfiles package_name`
## view package binary is associated with
`dpkg --search path_to_bin`
## display details of package
`apt show package_name`
## search for package
`apt search package_name`
## search for package showing only names, not details
`apt search --names-only package_name`
## search for package with multiple conditions
`apt search package_name module image`
## remove package
`apt remove package_name`
## remove package with dependencies no longer used by system
`apt autoremove package_name`
## source file for repos
`/etc/apt/sources.list`
### or
`/etc/apt/sources.list.d/ubuntu.sources`

# third party repos
* download public key
* darmor key with gpg - gpg --dearmor app.key
* key into /etc/apt/keyrings
* create new .list file in /etc/apt/sources.list.d/ specifying key file
* sudo apt update

# PPA - Personal app repo
`sudo add-apt-repository ppa:graphics-drivers/ppa`
## list ppa's installed
`add-apt-repository --list`
## remove ppa
`add-apt-repository --remove ppa:graphics-drivers/ppa`


