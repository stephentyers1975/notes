# Git Manage Remotes
a. In /usr/src/kodekloudrepos/demo repo add a new remote dev_demo and point it to /opt/xfusioncorp_demo.git repository.

b. There is a file /tmp/index.html on same server; copy this file to the repo and add/commit to master branch.

c. Finally push master branch to this new remote origin.

`git remote add dev_demo /opt/xfusioncorp_demo.git`
`cp /tmp/index.html .`
`git add .`
`git commit -m "added index.html"`
`git push dev_demo master`