# Set Up and Manage a Secure Azure Dev Ops Repository
The Nautilus DevOps Team has received a request from the Development Team to set up a new repository for better code management. They need a secure way to access the repository using SSH.

Create an organization with the name it picks up by default ( do not use any custom name ), create a project named devops-project under it and an Azure DevOps repository named devops-repo under the same.
Add the root user's SSH public key from azure-client host to the Azure DevOps SSH keys.
Create an SSH config under /root/.ssh/config on azure-client host and make changes to authenticate with the created repository.
Clone the new repository on azure-client host under /root.
Add the contents of /root/pyapp directory to this repository, then add, commit, and push the changes to the repository. You might need to set the git user and email to commit your code; you can use any email ID and user name for that.

* create project and repo in devops portal
* export publich ssh key
`cat ~/.ssh/id_rsa.pub`
* store public key in repo security section
* create ssh config file in ~/.ssh/config
```
# GITHUB
Host dev.azure.com
   HostName dev.azure.com
   PreferredAuthentications publickey
   IdentityFile /root/.ssh/id_rsa
   IdentitiesOnly yes
```
* clone repo in correct directory
`git@ssh.dev.azure.com:v3/kklabusermain-4158ef6a7c4840cd/devops-project/devops-repo`
* copy contents into repo
* add, commit and push changes
`git config --global user.email "steve@example.com"`
`git config --global user.name "steve"`
`git add .`
`git commit -m "added app.py"`
`git push origin main`