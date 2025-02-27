# Linux Collaborative Directories
Setup a collaborative directory /dbadmin/data on app server 3 in Stratos Datacenter.

The directory should be group owned by the group dbadmin and the group should own the files inside the directory. The directory should be read/write/execute to the user and group owners, and others should not have any access.
## set up directory
`mkdir -p /dbadmin/data`
## change group ownership of directory
`chgrp -R dbadmin /dbadmin/data/`
## change directory permissions
`chmod ug=rwx,o= /dbadmin/data/`