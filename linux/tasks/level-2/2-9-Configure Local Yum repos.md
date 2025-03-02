# Configure Local Yum repos
a. We have some packages already present at location /packages/downloaded_rpms/ on Nautilus Backup Server.

b. Create a yum repo named local_yum and make sure to set Repository ID to local_yum. Configure it to use package's location /packages/downloaded_rpms/.

c. Install package wget from this newly created repo.

## configure new repo
`vi /etc/yum.repos.d/local_yum.repo`
```
[local_yum]
name=Local YUM Repository
baseurl=file:///packages/downloaded_rpms/
enabled=1
gpgcheck=0

```
## check new repo is in list
`yum repolist`
## install wget from new repo
`yum install --enablerepo=local_yum wget -y`