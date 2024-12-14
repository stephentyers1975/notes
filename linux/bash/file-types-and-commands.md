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
