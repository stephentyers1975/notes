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
## remove unwanted file from project - keep in directory
`git rm --cached file1`
## remove unwanted file from project - Delete from directory
`git rm -f file1`
## add files to ignore file that you wish git to ignore
`.gitignore`
## view changes to repo
`git log`
## view changes to repo concise on one line
`git log --oneline`
## view file name and hash changes to repo
`git log --raw`
## list changed file names
`git log --name-only`
## show last 3 commits
`git log -n 3`
## shows visual commit tree and branch dependencies of other branched
`git log --graph --decorate`
## view details of a single change
`git show hash_numofchange`

# GIT branches
## create new branch
`git branch branch_name`
## create new branch and immediately switch to it
`git checkout -b branch_name`
## switch to branch
`git checkout branch_name`
## delete a branch
`git branch --delete branch_name`
## see all branches
`git branch --list`
### or
`git branch`
# delete branch
`git branch -d branch_name`
## add and commit file at the same time
`git commit -a -m "message"`


# Merging branches
## switch to master branch you wish to pull changes from new feature branch
`git checkout master`
## pull to changes to master branch from feature branch - fast forward
`git merge feature_branch`
## pull to changes to master branch from feature branch - fast forward
`git merge --no-ff feature_branch`

!['fast-forward'](/images/fastforward.png)
* no fast forward shows you the commit history objects from the other feature branch that makes up the new merge features. Useful if you need to roll backup

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
## update local repo from remote repo
`git fetch origin master`
### then
`git merge origin/master`
## git fetch and pull in one command
`git pull origin master`
