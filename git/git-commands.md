# GIT
## config global username and email - not login information, but for repo changes. If global emitted the details will be set on a per repo basis
`git config --global user.name "steve"`
`git config --global user.email "steve@email.com"`
## initialize repp
`git init`
## create bare repo
`sudo git init --bare media.git`
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
## clean repo files - forces the cleaning of untracked files
`git clean -f`
## clean repo files and dirs - forces the cleaning of untracked files
`git clean -fd`
## commit changes
`git commit -m "commit msg"`
## remove unwanted file from project - keep in directory
`git rm --cached file1`
## remove unwanted file from project - Delete from directory
`git rm -f file1`
## add files to ignore file that you wish git to ignore
`.gitignore`
## view commit changes to repo
`git log`
## view changes to repo concise on one line
`git log --oneline`
## view file name and hash changes to repo
`git log --raw`
## list changed file names
`git log --name-only`
## show last 3 commits
`git log -n 3`
## show log of remote repo
`git log origin master`
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
## list all local branches
`git branch --list`
### or
`git branch`
# list all branches local and remote - remote branches have remote prefix
`git branch -a`
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

# Rebasing - The git rebase command allows you to easily change a series of commits, modifying the history of your repository. You can reorder, edit, or squash commits together.
`git rebase master` 
## interactive rebase - interactively rebase last 4 commits
`git -i rebase HEAD~4`

# Cherrypick commits
`git cherry-pick hash_of_commit`

* GIT Merge - complete picture of the commit history and branch evolution
!['merge'](/images/merge.png)
* GIT Rebase - Tidies up history by moving branch commits to the main branch tip
!['rebase'](/images/rebase.png)
* Squashing commits - consolidates commits into one commit providing a clean linear history in the main branch, but at the cost etailed commit history.
!['squash'](/images/squash.png)

# Resetting and Reverting
## revert commit - undos changes but keeps a log record in the history of previous incorrect commit
`git revert hash_of_commit`
## git reset - soft - resets commit and keeps file changes of changed file(s) before commit
`git reset --soft HEAD~1`
## git reset - hard - resets commit but looses file changes of changed file(s) before commit
`git reset --hard HEAD~1`

# Stash
## push changes to temporary stash area
`git stash`
## list all stashes 
`git stash list`
## list certain stash 
`git stash show stash{num}`
## pop last added stash
`git stash pop`
## pop specific stash
`git stash pop stash{num}`

# Reflog
## show all changes/action/logs on repo
`git reflog`
## reset back using hash
`git reset --hard hash_num`

!['internals'](/images/plumbing.png)