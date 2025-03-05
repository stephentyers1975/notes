# Git Stash
The Nautilus application development team was working on a git repository /usr/src/kodekloudrepos/media present on Storage server in Stratos DC. One of the developers stashed some in-progress changes in this repository, but now they want to restore some of the stashed changes. Find below more details to accomplish this task:

Look for the stashed changes under /usr/src/kodekloudrepos/media git repository, and restore the stash with stash@{1} identifier. Further, commit and push your changes to the origin.

## check stash list
`git stash list`
## pop required stash using id
`git stash pop stash@{1}`
## commit and push changes to origin
`git add .`
`git commit -m "added welcome.txt"`
`git push origin master`