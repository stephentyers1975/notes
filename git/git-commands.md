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
## stage and show whats changed in files
`git add -p`
## unstage file
`git reset --staged file1`
## undo changes to file prior to staging
`git checkout -- filename`
### or
`git checkout filename`
## look at particular file state in previous commit by using hash in detached HEAD state - not ideal as it branches our version history
`git checkout <HASH>`
## look at particular file/folders state in previous commit by using hash but keeps current HEAD on last commit - ideal 
`git checkout <HASH> filename/folder/.`
## clean repo files - forces the cleaning of untracked files
`git clean -f`
## clean repo files and dirs - forces the cleaning of untracked files
`git clean -fd`
## commit changes
`git commit -m "commit msg"`
## overwrite previous commit if you made a mistake in the message or missed adding files(must stage files first) to commit
`git commit -m "corrected commit msg" --amend`
### or -> pop up message will appear to edit previous commit msg
`git add <file1> <file2>`
`git commit --amend`
### or -> add or change files without changing commit message
`git add <file>`
`git commit --amend --no-edit`
## remove unwanted file from project - keep in directory
`git rm --cached file1`
## remove unwanted file from project - Delete from directory
`git rm -f file1`
## add files to ignore file that you wish git to ignore
`.gitignore`
## view commit changes to commit log
`git log`
## view changes to commit log concise on one line
`git log --oneline`
## view file name and hash changes to commit log
`git log --raw`
## list changed file names
`git log --name-only`
## show last 3 commits
`git log -n 3`
## show log of remote commits
`git log origin master`
## shows visual commit tree and branch dependencies of other branched
`git log --graph --decorate`
## shows visual commit tree 
`git log --graph --all`
## view details of a single change
`git show hash_numofchange`
## check differences between unstaged changed file(s) and previous commit
`git diff`
## check differences between staged changed file(s) and previous commit
`git diff --cached`
## check differences between two different commits
`git diff <HASH of commit>..<HASH of other commit>`
## check differences between two different branches
`git diff <name of one branch>..<name of another branch>`

# edit previous commit
## edit file
`git add file_name`
`git commit --amend`
`git commit --amend --no-edit`
# edit previous commit further back in history
```
git rebase -i <commit> opens an interactive session where you can:
pick: Use the commit as is.
edit: Stop and allow amending the commit.
reword: Change the commit message.
squash: Combine commits.
By changing the word "pick" to "edit", git will stop the rebase at that commit, and allow you to make changes, and then git commit --amend those changes.
```

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

# More checkout commands
## look at 2 commits prior
`git checkout HEAD~2`
## look at particular file state in previous commit by using hash in detached HEAD state - not ideal as it branches our version history
`git checkout <HASH>`
## look at particular file/folders state in previous commit by using hash but keeps current HEAD on last commit - ideal 
`git checkout <HASH> filename/folder/.`
### return back to HEAD
`git checkout branch_name`
### or
`git checkout -`
### or
`git reflog`
## go back to the last commit version of file before staging
`git restore filename`
### or
`git checkout filename`


# Merging branches
## switch to master branch that you wish to pull changes into from the new feature branch
`git checkout master`
## pull to changes to master branch from the new feature branch - fast forward
`git merge feature_branch`
## pull to changes to master branch from feature branch - no fast forward
`git merge --no-ff feature_branch`
## show which branched have been merged
`git branch --merged`

!['fast-forward'](/images/fastforward.png)
* no fast forward shows you the commit history objects from the other feature branch that makes up the new merge features. Useful if you need to roll backup

# Remote repos
## check if local repo is associated with any remote repo
`git remote -v`
## add remote repo
`git remote add origin repo_url`
## add remote upstream from branch (if you forked another users code)
`git remote add upstream <URL of repo>`
## remove remote repo
`git remote remove origin`
## push to repo
`git push origin branch_name`
## force push to repo overwriting previous commits
`git push origin branch_name -f`
## pull latest code from remote repo
`git pull origin branch_name`
## setup parameterless pull/push
`git push -u origin main`
## pull latest code from remote repo and set upstream
`git pull origin branch_name --set-upstream`
## shortcut pull command if above upstream has been set
`git pull`
## clone repo
`git clone repogit_url`
## update local repo from remote repo
`git fetch origin branch_name`
### then
`git merge origin/master`
## git fetch and pull in one command
`git pull origin master`
## delete remote branch
`git push origin --delete <branch_name>`
## prune deleted remote branches from local
`git fetch origin --prune`

# Rebasing - The git rebase command allows you to easily change a series of commits, modifying the history of your repository. You can reorder, edit, or squash commits together. Usuall not run from master/main branch
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
## revert commit - undos changes/deletes files but keeps a log record in the history of previous incorrect commits
`git revert hash_of_commit`
## revert latest commit from HEAD
`git revert HEAD`
## git reset - soft - resets commit history and keeps staged file changes of changed file(s) before commit
`git reset --soft HEAD~1`
## git reset - hard - resets commit history but looses/deletes staged file changes/working directory changed file(s) before commit
`git reset --hard HEAD~1`
## force pushed changes to hard reset remote branch
`git push origin master --force`

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
## force pushed changes to hard reset remote branch
`git push origin master --force`

!['internals'](/images/plumbing.png)

# Tagging
```
1.23.444
major.minor.patch
```
## View all tags
`git tag`
## view specific tag details
`git show v2.0.0`
## add new tag to commit
`git tag -a v3.5.3 -m "Release 3.5.3`

# cherry-pick - merge selective commits to a branch
## switch to target branch and cherry-pick commit by hash from feature branch
`git cherry-pick ddf6c2b`
