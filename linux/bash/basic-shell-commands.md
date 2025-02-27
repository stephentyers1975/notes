# Basic Commands
## get help
`cmd --help`
## detail help
`man cmd`
## display types of man pages
`man man`
## display help from man section
`man section_num cmd`
`man 1 printf`
## detailed docs can be found in
`/usr/shar/doc/`
## search through man pages for command by keyword
`apropos search_keyword`
## search through man pages for command by keyword, filter by specific man section 1 and 8 where commands live
`apropos -s 1,8 search_keyword`
## refresh mandb for apropos searches
`sudo mandb`
## show kernel
`uname`
## show kernel version
`uname -r`
## Show shell type
`echo $SHELL`
## change shell, provide path after command
`chsh`
## print to screen
`echo hello`
## print to screen with removing newline
`echo -n hello`
## show basic definition and help for a command
`whatis example_command`
## show full help manual for a command
`man example_command`
## search for a command by keyword
`apropos keyword`
## append --help to certain commands for help and usage
`date --help`
## display whether command is buitin or run from external script
`type example_cmd`
## list os related files
`ls /etc/*release*`  
`cat /etc/*release*`
## check os
`cat /etc/os_release`
## check system uptime
`uptime`
## see who logged into the system
`last`
## List files and folders
`ls`
## List long list files and folders
`ls -l`
## List hidden files and folders
`ls -a`
## List in human readable format -> bytes / kilobytes etc
`ls -lh`
## List files and folders in order they were create
`ls -lt`
## List files and folders in reverse order they were create
`ls -ltr`
## check file location on disk
`stat filename`
## Change Directory
`cd my_dir1`
## change to previous directory
`cd -`
## change to home directory
`cd`
## change to home directory
`cd /`
## present working directory
`pwd`
## make directory
`mkdir new_dir`
## make mulitple directories at once
`mkdir new_dir new_dir2 new_dir3`
## multiple commands
`cd new_directory; mkdir www; pwd`
## make full directory hieracy/tree
`mkdir –p /tmp/asia/india/bangalore`
## remember current directory with pushd. You can push multiple dirs on to stack
`pushd /etc`
## return to remembered directory from popd
`popd`
## remove directory
`rm –r /tmp/my_dir1`
## copy directory
`cp –r my_dir1 /tmp/my_dir1`
## create a new file (no contents)
`touch new_file.txt`
## add contents to file
`cat > new_file.txt`  
This is some sample contents  
CTLR + D
## view contents of a file
`cat new_file.txt`
## view contents for file with more
`more text_file`  
[space] scrolls forwrad one screen at a time    
[enter] scrolls one line at a time  
[b] scrolls back one screen at a time  
[/] search text
## view contents for file with less
`less text_file`  
[up arrow] scrolls up the display one line    
[down arrow] scrolls down the display one line   
[/] search text
## view end of file - optional n for number of lines
`tail -n 20 /var/log/apt/term.log`
## view start of file - - optional n for number of lines
`head -n 20 /var/log/apt/term.log`
## replace substitute term in file -preview
`sed 's/canda/canada/g' userinfo.txt`
## replace substitute term in file - inplace file change
`sed -i 's/canda/canada/g' userinfo.txt`
## replace substitute term in file ignore case - inplace file change
`sed -i 's/disabled/enabled/gI' /home/bob/values.conf`
## replace substitute term in file between line number range - inplace file change
`sed -i '500,2000s/enabled/disabled/gI' /home/bob/values.conf`
## delete first 42 lines with SED
`sed -i 1,42d dump.sql`
## search and replace using word boundaries and writing to new file
`sed 's/\band\b/for/g' /home/BSD.txt > /home/BSD_REPLACE.txt`
## delete first 42 lines with tail
`tail +43 dump.sql > dumpfile2`
## cut columns out of text file
`cut -d ' ' -f 1 userinfo.txt`
### or
`cut -d: -f1 /etc/passwd`
## cut columns out of a text file using awk
`awk -F':' '{print $1}' /etc/passwd`
## remove repeated entries that are next to eachother
`uniq countries.txt`
## sort
`sort countries.txt`
## sort and create unique list
`sort countries.txt | uniq`
## differences in file
`diff file1 file2`
## differences in file with context
`diff -c file1 file2`
## differences side by side
`sdiff file1 file2`
## copy a file
`cp new_file.txt copy_file.txt `
## copy a file or dirs recursively
`cp -r /home/bob/dir_struct target_dir `
## copy a file and preserve ownership/permissions
`cp -p /home/bob/myfile.txt /home/bob/data/`
## move (rename) a file
`mv new_file.txt sample_file.txt`
## remove/delete a file
`rm new_file.txt`
## remove/delete a file recursively
`rm -r new_file.txt`
## remove/delete a file recursively without confirmation
`rm -rf new_file.txt`
## create alias of command
`alias dt-date`
## show history of commands used in session
`history`
## show all environment variables
`env`
## set environment variables across all processes
`export OFFICE=london`
## set environment variables just in terminal session
`OFFICE=london`
## set permantly after logout/reboot, store in
`~/.profile` 
### or
`~/.pam_environment`
## display path variable
`echo $PATH`
## check if command is referenced in the PATH variable
`which example_command`
## add new command to PATH variable
`export PATH=$PATH:/opt/example_command`
## view BASH prompt configuration
`echo $PS1` 
## update BASH prompt configuration
`PS1="[\d \t \u@\h:\w ] $ "` 



