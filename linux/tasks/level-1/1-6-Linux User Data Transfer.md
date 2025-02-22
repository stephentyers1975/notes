# Linux User Data Transfer
Locate all files (excluding directories) owned by user mariyam within the /home/usersdata directory on App Server 1. Copy these files while preserving the directory structure to the /news directory.
`find /home/usersdata -type f -user mariyam -exec cp --parents {} /news \;`