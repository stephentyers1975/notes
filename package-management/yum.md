# YUM package manager
## install a package
`yum install ansible`
## Install package by version number
`yum install ansible-2.4.2.0`
## repo file location
`/etc/yum.repos.d`
## List package names from repositories
`yum list package_name`
## List installed packages
`yum list installed`
## search for packages by query or decription
`yum search package_name`
## remove a package
`yum remove ansible`
## Display information about a package
`yum info package_name`
## show duplicate packages
`yum --showduplicates list package_name`
