# Process commands
## view process in current terminal session
`ps`
## view all processes running on systems with users. Kernal processes are wrappede in square brackets
`ps aux`
## show currently running processes
`top`
## show specific process by ID number
`ps 1`
## show specific process by ID number with user
`ps u 1`
## show user specific processes 
`ps u -U steve`
## search for process by name, includes cmd that started process
`pgrep -a syslog`
## launch process with defined NICE value - lower has more cpu priority
`nice -n [NICE VALUE] [COMMAND]`
`nice -n 11 bash`
## alter exisiting process NICE value
`renice [NEW NICE VALUE] PID`
## show processes with NICE values
`ps lax`
## show processes that are parents for other processes in tree format
`ps fax`
## show processes with combined options
`ps faux`
## show list of process kill signal option
`kill -l`
## kill a process
`kill -9 PID`
`kill -SIGKILL PID`
`kill -KILL PID`
## kill a process by name
`pkill -KILL process_name`

# Background and foreground process management
## pause an app and return to terminal. Paused process freezes and does not continue until brought back to fg
`ctrl z`
## return to pause app
`fg`
## move app to background and continue processing
`example_cmd &`
## check if any programs are running in background
`jobs`
## return to background app
`fg Job_num`
## resume to background app
`bg Job_num`
## view files/dirs process was using
`sudo lsof -p pid`
## check if file/dir is being used by any process
`sudo lsof dir_path`