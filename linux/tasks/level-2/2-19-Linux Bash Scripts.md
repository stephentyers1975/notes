# Linux Bash Scripts
The production support team of xFusionCorp Industries is working on developing some bash scripts to automate different day to day tasks. One is to create a bash script for taking websites backup. They have a static website running on App Server 3 in Stratos Datacenter, and they need to create a bash script named official_backup.sh which should accomplish the following tasks. (Also remember to place the script under /scripts directory on App Server 3).

a. Create a zip archive named xfusioncorp_official.zip of /var/www/html/official directory.

b. Save the archive in /backup/ on App Server 3. This is a temporary storage, as backups from this location will be clean on weekly basis. Therefore, we also need to save this backup archive on Nautilus Backup Server.

c. Copy the created archive to Nautilus Backup Server server in /backup/ location.

d. Please make sure script won't ask for password while copying the archive file. Additionally, the respective server user (for example, tony in case of App Server 1) must be able to run it.

## create script
```
#!/bin/bash

# Define variables
SRC_DIR="/var/www/html/official"
BACKUP_DIR="/backup"
BACKUP_FILE="xfusioncorp_official.zip"
NAUTILUS_BACKUP_SERVER="stbkp01"
NAUTILUS_BACKUP_DIR="/backup"
NAUTILUS_USER="clint"  # replace with the appropriate user

# Create a zip archive of the source directory
zip -r ${BACKUP_DIR}/${BACKUP_FILE} ${SRC_DIR}

# Copy the archive to the Nautilus Backup Server
scp -o StrictHostKeyChecking=no ${BACKUP_DIR}/${BACKUP_FILE} ${NAUTILUS_USER}@${NAUTILUS_BACKUP_SERVER}:${NAUTILUS_BACKUP_DIR}
```
## make script executable
`chmod +x /scripts/official_backup.sh`

## create ssh key pair for banner user to use on stapp01
`ssh-keygen -t rsa -b 2048`
## copy banner public key to stbkp01
`ssh-copy-id -i ~/.ssh/id_rsa.pub clint@stbkp01`
## After testing login with private key, run script
`./official_backup.sh`
