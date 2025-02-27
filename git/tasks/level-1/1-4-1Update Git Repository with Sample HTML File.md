# Update Git Repository with Sample HTML File
Copy the sample index.html file from the jump host to the storage server placing it within the cloned repository at /usr/src/kodekloudrepos/cluster.
Add and commit the file to the repository.
Push the changes to the master branch.

`scp /tmp/index.html natasha@ststor01:/tmp`
`git add index.html`
`git commit -m "added index.html"`
`git push origin master`