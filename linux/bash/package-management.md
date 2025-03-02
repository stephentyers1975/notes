# Package Management
![package management matrix](/images/package_mgt.png)
## RPM comands (db in /var/lib/rpm) - Low Level Package Manager from Redhat - RPM doesn't resolve package dependencies on its own. It needs higher level programs like APT/YUM
### Install
`rpm -ivh telnet.rpm`
### Uninstall
`rpm -e telnet.rpm`
### Upgrade
`rpm -Uvh telnet.rpm`
### Query
`rpm -q telnet.rpm`
### Verifying
`rpm -Vf telnet.rpm`
## Yum Package Manager - High level package manager that handles dependencies and depends on RPM (/etc/yum.repos.d)
### install package
`yum install package_name`
### install package without confirmation
`yum install -y package_name`
### show repo list
`yum repolist`
### show which package needs to be installed for a specific command to work
`yum provides example_cmd`
### remove package
`yum remove example_packages`
### update a package
`yum update example_packages`
### update all packages
`yum update`
### configure new repo
`vi /etc/yum.repos.d/local_yum.repo`
```
[local_yum]
name=Local YUM Repository
baseurl=file:///packages/downloaded_rpms/
enabled=1
gpgcheck=0

```
### check new repo is in list
`yum repolist`
### install package from new repo
`yum install --enablerepo=local_yum package_name -y`

## DPKG Package Manager - Low Level Package Manager from Debian, does not deal with dependencies
### Install
`dpkg -i telnet.rpm`
### Uninstall
`dpkg -r telnet.rpm`
### List
`dpkg -l telnet.rpm`
### Status
`dpkg -s telnet.rpm`
### Verifying
`dpkg -v telnet.rpm`
## APT Package Manager - High level package manager that handles dependencies and depends on DPKG (/etc/apt/sources.list)
### update
`apt update`
### upgrade
`apt upgrade`
### edit sources file /etc/apt/sources.list
`apt edit-sources`
## install
`apt install package_name`
## remove
`apt remove package_name`
## search
`apt search package_name`
## list
`apt list | grep package_name`





