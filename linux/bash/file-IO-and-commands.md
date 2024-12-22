# File types
* Regular files
* Directory
* Special

## Special file types
* Character Files
* Block Files
* Links -> Hard Links or Soft Links
* Socket Files
* Named Pipes

## Identify file type command
`file example_file`
## or run below and look at the first letter in the output list
`ls -ld example_file`
## key for letter out
* d = directory
* \- = regular file
* c = charatcer
* l = link
* s = socket file
* p = pipe file
* b = block device

# Directory hierachy
!["file hieracy image"](/images/file_hieracy.png)
* /opt directory for 3rd party apps
* /mnt directory used for file systems temporarily
* /tmp directory used for to store temp data
* /media directory used for mounting all external media like USB
* /dev directory used for special block and character device files like external HD's , mouse, keyboard
* /bin directory used for basic programs and binaries like cp or mv
* /etc directory is very important and used for most configuration files on Linux
* /lib directory used to store shared libraries that can be imported into programs
* /usr directory used for storing user applications and their data like thunderbird, mozilla etc... In legacy systems it was used to store home directories
* /var directory used by the system to write data such as logs and cached data.
## comand to check mounted file systems
`df -hP`

# File Links
## show inode and links of a file
`stat file_name`
## create hard link -> You can only hard link to files, not folders, and on the same file system
`ln path_to_target_file path_to_link_file`
## create soft/symbolic link - You can soft link to files and directories on different
`ln -s path_to_target_file path_to_link_file`
## display full path to softlinked file
`readlink path_to_link_file`
### or see in directory
`ls -l path_to_link_file`

# File Permissions
* read -> r -> 4 (octal)
* write -> w -> 2 (octal)
* execute -> x -> 1 (octal)
* no permission -> - -> 0 (octal)
## Modify file permissions (symbolic)
`chmod u+rwx test-file` - provide full access to owner
### another example
`chmod ugo+r-x test-file` - provide read access and remove execute to owner, group and other
### another example
`chmod o-rwx test-file` - remove all access for others
### another example
`chmod u+rwx,g+r-x,o-rwx test-file` - provide full access to owner, read access but remove execute for group and no permissions for others
## Modify file permissions (numeric)
`chmod 777 test_file` - provide full access for owner, group and other
## another example
`chmod 555 test_file` - Provide read and execute access for owner, group and other
## another example
`chmod 660 test_file` - Provide read and write access for owner and group. None for other 
## another example
`chmod 750 test_file` - Provide read, write and execute access for owner. Read and execute for group, none for other

# Change File ownership and Group assigned
## change file ownership (file and group)
`chown bob:developer test_file` - change test_file ownership to bob and group to developer
## change just file user ownership
`chown bob test_file` - changes just the file ownership, group unchanged
## change just directory and all sub directories reursively user ownership
`chown -R bob test_dir` - changes recursively the directory and sub directories/file ownership
## change just the group assigned to file
`chgrp developer test_file` - changes the group of test_file to developer

## SUID bit - execute bit -> set user identification bit to 4 which is the fourth bit. other users can execute file as owner permisions
`chmod 4664 test_file`
* -rwSrw-r-- -> Capital S means suid is enabled, but no user/owner execute permissions enabled
`chmod 4764 test_file`
* -rwsrw-r-- -> lowercase s means suid is enabled, user/owner execute permissions enabled
## SGID bit - set group identification bit to 2 which is the fourth bit. 
`chmod 2664 test_grouo`
## Find files with SUID bit set
`find . -perm /4000`
## Find files with SGID bit set
`find . -perm /2000`
## Set sticky bit with 1 or +t on directory - stops other users deleting
`chmod +t test_dir`
### or
`chmod 1777 test_dir` 
* drw-rw-rwt -> lowercase t means execut bit is also set
* drw-rw-rwT -> uppercase means execute bit is not set
## summary of SUID,SGID and stick bit
* SUID - Allows users to run an executable as the executable owner. This is useful for programs that require elevated access.
* SGID - Similiar to SUID but applies to both files and directories. This is useful for shared resources. file to be executed as the group that owns the file (similar to SUID). If set on a directory, any files created in the directory will have their group ownership set to that of the directory owner
* Sticky bit - Set on directory and restricts file deletion in directory
* Start at 0
* SUID = 4
* SGID = 2
* Sticky = 1

# File Compression and Archiving
## print file size
`du -sk file_name`
## print file size in human readable format
`du -sh file_name`
## print file size using ls with -h
`ls -lh file_name`
## Archiving a file
`tar -cf test.tar file1 file2 file3`
## show contents of tarball archive
`tar -tf test.tar`
## extract contents of tarball archive
`tar -xf test.tar`
## compress tarball to reduce size
`tar -zcf test.tar file1 file2 file3`
# Compression tools
## bzip2 (adds extension bz2)
`bzip2 test.img`
## gzip (adds extension gz)
`gzip test.img`
## xz (adds extension xz)
`xz test.img`
# Uncompression tools
## bunzip2 
`bunzip2 test.img.bz2`
## gunzip 
`gunzip test.img.gz`
## unxz 
`unxz test.img.xz`
# Read files inside compressed without uncompressing
`bzcat test.img.bz2`  
`zcat test.img.gz`  
`xzcat test.img.xz`

# Searching for files
## locate command (depends on mlocate.db)
`locate file.example`
## update mlocate.db for update command to refresh post software install (run as root)
`updatedb`
## find command
`find /home/michael -name city.txt`
## search for pattern within file using grep
`grep search_pattern filename`
## search for pattern case insensitive within file using grep
`grep -i search_pattern filename`
## search for pattern recursively within directories using grep
`grep -r search_pattern filename`
## search for patterns that don't contain the search pattern using grep
`grep -v search_pattern filename`
## search for whole word pattern using grep
`grep -w search_pattern filename`
## search for pattern and display line of text 1 after/below using grep
`grep -A1 search_pattern filename`
## search for pattern and display line of text 1 above/before using grep
`grep -B1 search_pattern filename`
## search for pattern and display line of text 4 above/before using grep, this can be any number
`grep -B1 4 search_pattern filename`
## search for pattern and display lines above and below using grep
`grep -A1 -B1 search_pattern filename`

# IO Redirection
![io_redirection](/images/io_redirection.png)
## Redirect STDOUT
### redirect into file overwrite
`echo $SHELL > file.txt`
### redirect into file append
`echo $SHELL >> file.txt`
## Redirect STDERR
### redirect error into file overwrite
`echo missingfile 2> error.txt`
### redirect into file append
`echo missingfile 2>> error.txt`
### redirect without showing error on screen into bit bucket
`echo missingfile 2> /dev/null`
## Command line pipes
`grep Hello test.txt | less`
## tee command. used to split the output of a program so that it can be both displayed in STDOUT and saved in a file
`echo $SHELL | tee shell.txt`
## tee command with append
`echo $SHELL | tee -a shell.txt`