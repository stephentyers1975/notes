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


# Summary of SUID,SGID and stick bit
* SUID - Allows users to run an executable as the executable owner. This is useful for programs that require elevated access.
* SGID - Similiar to SUID but applies to both files and directories. This is useful for shared resources. file to be executed as the group that owns the file (similar to SUID). If set on a directory, any files created in the directory will have their group ownership set to that of the directory owner
* Sticky bit - Set on directory and restricts file deletion in directory
* Start at 0
* SUID = 4
* SGID = 2
* Sticky = 1
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
## set SUID, GUID and sticky bit on dir
`chmod u+s,g+s,o+t /home/bob/datadir`
### or
`chmod 7755 /home/bob/datadir`

# Advanced Permissions - ACLS (+ in file attr)
## install acl package
`sudo apt install acl`
## add acl entry
`sudo setfacl --modify user:jeremy:rw file3`
## view acl
`getfacl file3`
## set effective
`sudo setfacl --modify mask:r file3`
## add groups
`sudo setfacl --modify group:sudo:rw file3`
## set zero permissions on user
`sudo setfacl --modify user:jeremy:--- file3`
## remove permissions for user
`sudo setfacl --remove user:jeremy file3`
## remove permissions for group
`sudo setfacl --remove group:sudo file3`
## remove all acls 
`sudo setfacl --remove-allfile3`
## apply recursively
`sudo setfacl --recursive -m user:jeremy:rwx dir1`
## remove recursively
`sudo setfacl --recursive -remove user:jeremy:rwx dir1`
## enable append only on a file
`sudo chattr +a newfile`
## remove append only on a file
`sudo chattr -a newfile`
## enable immutable attribute on a file
`sudo chattr +i newfile`
## check atributes
`ls attr`
## remove immutable attribute on a file
`sudo chattr -i newfile`


# File Compression and Archiving
## print file size
`du -sk file_name`
## print file size in human readable format
`du -sh file_name`
## print file size using ls with -h
`ls -lh file_name`
## Archiving a file
`tar cf test.tar file1 file2 file3`
### or
`tar --create --file archive.tar file1 file2 file3`
## Append to an existing archive a file
`tar rf test.tar file4`
### or
`tar --append --file archive.tar file4`
## show contents of tarball archive
`tar -tf test.tar`
### or
`tar --list --file archive.tar`
## extract contents of tarball archive
`tar -xf test.tar`
### or
`tar --extract --file test.tar`
## extract to different directory
`tar --extract --file test.tar --directory /tmp`
### or
`tar xf test.tar -C /tmp/`
## compress tarball to reduce size
`tar -zcf test.tar file1 file2 file3`

# Compression tools
## bzip2 (adds extension bz2) - only can comprees one file, does not pack multiple files
`bzip2 test.img`
## gzip (adds extension gz) - only can comprees one file, does not pack multiple files
`gzip test.img`
## xz (adds extension xz) - only can comprees one file, does not pack multiple files
`xz test.img`
# Uncompression tools
## bunzip2 
`bunzip2 test.img.bz2`
### or
`bzip2 --decompresss test.img.bz2`
## gunzip 
`gunzip test.img.gz`
### or
`gzip --decompresss test.img.gz` 
## unxz 
`unxz test.img.xz`
### or
`xz --decompresss test.img.xz`
## Keep original archive file add
`--keep`
### or
`-k`
## Read files inside compressed without uncompressing
`bzcat test.img.bz2`  
`zcat test.img.gz`  
`xzcat test.img.xz`
## zip - can comprees multiple files - combines packing ability of tar with compression
`zip archive file1`
## recursively compress all images in directory
`zip -r archive.zip Pictures/`
## decompress zip file
`unzip archive.zip`

# All in one archiving/packing and compression using TAR
## gzip version
`tar --create --gzip --file archive.tar.gz file1`
### or
`tar czf archive.tar.gz file1`
## bzip2 version
`tar --create --bzip2 --file archive.tar.bz2 file1`
### or
`tar cjf archive.tar.bz2 file1`
## bzip2 version
`tar --create --xz --file archive.tar.xz file1`
### or
`tar cJf archive.tar.xz file1`
## auto selection
`tar --create --autocompress --file archive.tar.gz file1`
### or
`tar caf archive.gz file1`

## extract with tar
`tar --extract --file archive.tar.gz`
### or
`tar xf archive.tar.gz file1`
## extract to another directory
`sudo tar xf /home/bob/archive.tar.gz -C /opt`
### or
`sudo tar --extract --file /home/bob/archive.tar.gz --directory /opt`

# Backup - rsync
## local src -> remote dst
`rsync -a Pictures/ aaron@9.9.9.9:/home/aaron/picturs/`
## remote src -> local dst
`rsync -a aaron@9.9.9.9:/home/aaron/picturs/ Pictures/`
## local src -> local dst
`rsync -a Pictures/ backup/Pictures/`

# Disk Imaging - dd
## take image of disk - first umount
`sudo dd if=/dev/vda of=diskimage.raw bs=1M status=progress`
## restore image back to disk
`sudo dd if=diskimage.raw of=/dev/vda bs=1M status=progress`

# Searching for files
## locate command (depends on mlocate.db)
`locate file.example`
## update mlocate.db for update command to refresh post software install (run as root)
`updatedb`
## find command
`find /home/michael -name city.txt`
## find command without path searches current directory
`find -name city.txt`
## find command based on file size
`find /lib64/ -size +10M`
## find command based on modified status in minutes
`find /dev/ -mmin -1`
## find command based on modified status based on 24 hour periods
`find -mtime 2`
## find command based on metadata changed status 
`find -cmin -5`
## find command based with case insensitive
`find /dev/ -iname felix`
## find command based using wildcard
`find /dev/ -name "f*"`
## find command based using not operator
`find /dev/ -not -name "f*"`
### or
`find /dev/ \! -name "f*"`
## find based on size -> c = bytes, k = kilobytes, M = megabytes, G = gigabytes. Use + or - for > and <
`find -size +512k`
## combine multiple parameters as in AND operator
`find / -name "f*" -size 512k`
## combine multiple parameters as in OR operator
`find / -name "f*" -o -size 512k`
## find based on exact specified octal permissions
`find -perm 664`
## find based on exact specified symbolic permissions
`find -perm u=rw,g=rw,o=r`
## find based on at least specified octal permissions
`find -perm -664`
## find that have any of the specified octal permissions
`find -perm /664`
## complex example
`sudo find /var/log/ -perm -g=w ! -perm /o=rw`
## find directory
`find /var/ -type d -name 'pets'`
## find files by owner and copy to another directory preserving attr and directories
`find . -user ravi -exec cp --parents --preserve {} /media \;`
## search for pattern within file using grep
`grep options search_pattern filename`
## search for pattern case insensitive within file using grep
`grep -i search_pattern filename`
## search for pattern recursively within directories using grep
`grep -r search_pattern filename`
## colour results
`grep -r --color search_pattern filename`
## search for patterns that don't contain the search pattern using grep
`grep -v search_pattern filename`
## search for whole word pattern using grep
`grep -w search_pattern filename`
## search for and return only the found result, not the whole line
`grep -io search_pattern filename`
## search for pattern and display line of text 1 after/below using grep
`grep -A1 search_pattern filename`
## search for pattern and display line of text 1 above/before using grep
`grep -B1 search_pattern filename`
## search for pattern and display line of text 4 above/before using grep, this can be any number
`grep -B1 4 search_pattern filename`
## search for pattern and display lines above and below using grep
`grep -A1 -B1 search_pattern filename`

# Regular Expressions
## use extended REGEX with grep
`grep -Er '0+' /etc/`
### or use egrep
`egrep -r '0+' /etc/`
## find 0 one or more times
`egrep -r '0+' /etc/`
## contain at least 3 zeros
`egrep -r '0{3,}' /etc/`
## contains 1 and minimum 3 zero's 
`egrep -r '10{3,}' /etc/`
## contains 1 and no minimum of zero's but a maximum of 3 zeros
`egrep -r '10{,3}' /etc/`
## contains 1 and and exactly 3 zeros
`egrep -r '10{3}' /etc/`
## match character exists zero or one time (optional)
`egrep -r 'disabled?' /etc/` 
## filter out word only and ignore rest of text
`egrep -o '\b[A-Z][a-z]{2}\b' /etc/nsswitch.conf`
## match on or condition
`egrep -r 'disabled|enabled' /etc/` 
## count results
`egrep -c 'disabled|enabled' /etc/` 
## Range or sets
`[a-z] [0-9] [abz124]`
## negate value in range
`[^a-z] [^0-9] [^abz124]`

# IO Redirection
* stdin 1>
* stdout <
* stderr >2
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
### redirect to multiple files from different output streams
`grep -r '^The' /etc/ 1> output.txt 2> errors.txt `
### redirect to one file from different output streams
`grep -r '^The' /etc/ > all_output.txt 2>&1`
### or
`grep -r '^The' /etc/ 1> all_output.txt 2>&1`
## Command line pipes
`grep Hello test.txt | less`
## tee command. used to split the output of a program so that it can be both displayed in STDOUT and saved in a file
`echo $SHELL | tee shell.txt`
## tee command with append
`echo $SHELL | tee -a shell.txt`
## Redirect input into command
`sendemailcmdexample test@tst.com < message.txt`
### or
```
sort << EOF
> 6
> 3
> 2
> EOF
```
### expression input
`bc <<< 1+2+3`
## piping command output 
`grep -v '^#' /etc/login.defs | sort | column -t` 