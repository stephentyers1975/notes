# GIT
## config global username and email - not login information, but for repo changes. If global emitted the details will be set on a per repo basis
`git config --global user.name "steve"`
`git config --global user.email "steve@email.com"`
## initialize repp
`git init`
## check files that have changed
`git status`
## stage changes
`git add file1 file2etc`
## stage all files of certain extension
`git add "*.html"`
## stage all files of certain directory an extension
`git add "products/*.html"`
## stage all changes
`git add .`
## unstage file
`git reset file1`
## commit changes
`git commit -m "commit msg"`
## remove unwanted file from project
`git rm file1`
## view changes to repo
`git log`
## view file changes to repo
`git log --raw`
## view details of a single change
`git show hash_numofchange`

# GIT branches
## add branch
`git branch branch_name`
## delete a branch
`git branch --delete branch_name`
## see all branches
`git branch --list`
### or
`git branch`
## switch to branch
`git checkout branch_name`
# delete branch
`git branch -d branch_name`
## add and commit file at the same time
`git commit -a -m "message"`

# Merging branches
## switch to master branch you wish to pull changes from new feature branch
`git checkout master`
`git merge feature_branch`

# Remote repos
## check if local repo is associated with any remote repo
`git remote -v`
## add remote repo
`git remote add origin repo_url`
## push to repo
`git push origin branch_name`
## pull latest code from remote repo
`git pull origin branch_name`
## clone repo
`git clone repogit_url`
