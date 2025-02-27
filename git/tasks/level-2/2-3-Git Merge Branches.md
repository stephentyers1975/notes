# Git Merge Branches
The Nautilus application development team has been working on a project repository /opt/apps.git. This repo is cloned at /usr/src/kodekloudrepos on storage server in Stratos DC. They recently shared the following requirements with DevOps team:

Create a new branch devops in /usr/src/kodekloudrepos/apps repo from master and copy the /tmp/index.html file (present on storage server itself) into the repo. Further, add/commit this file in the new branch and merge back that branch into master branch. Finally, push the changes to the origin for both of the branches.

`git branch devops`
`git checkout devops`
`cp /tmp/index.html .`
`git add index.html`
`git commit -m "added index.html`
`git switch master`
`git merge devops`
`git push origin devops`
`git push origin master`