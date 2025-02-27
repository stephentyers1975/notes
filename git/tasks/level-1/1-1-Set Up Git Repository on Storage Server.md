# Set Up Git Repository on Storage Server
Utilize yum to install the git package on the Storage Server.
Create a bare repository named /opt/demo.git (ensure exact name usage)
`yum install git`
`git init --bare /opt/demo.git`