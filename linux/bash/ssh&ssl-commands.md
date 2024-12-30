# Generate Private Public Key pair for SSH purposes
`ssh-keygen`
## or
`ssh-keygen -t rsa`
# View installed public keys on server
`cat ~/.ssh/authorized_keys`
# View configured hosts on server
`cat ~/.ssh/config`


# Generate Private/Public key pair with openSSL - X509 certifcates
## help
`openssl`
## view manuals for each comand
`man openssl <doubletab>`
### example help
`man openssl req`
`man openssl x509`
## Generate private key
`openssl genrsa -out my-bank.key 1024`
## Generate public key using private key
`openssl rsa -in my-bank.key -pubout > mybank.pem`

# Generate CSR
`openssl req -newkey rsa:2048 -keyout PRIVATEKEY.key -out MYCSR.csr`
## or
`sudo openssl req -new -newkey rsa:2048 -keyout key.pem -out req.pem`
## or
`sudo openssl req -new -newkey rsa:2048 -nodes -keyout PRIVATEKEY.key -out MYCSR.csr`
# Generate self-signed certificate
`sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout PRIVATEKEY.key -out self-signed.crt`
## or
`sudo openssl req -x509 -noenc -newkey rsa:4096 -days 365 -keyout myprivatekey.key -out self-signed.crt`
## Test certificate
`echo | openssl s_client -showcerts -servername app01.com -connect app01:443 2>/dev/null | openssl x509 -inform pem`
## view certicate details as text
`openssl x509 -in mycert.crt -text`

# SSH client and servers
#  Login and remote exec commands
## basic login
`ssh aparna@192.168.1.2`
### or
`ssh -l users_name host/ip`
## login with private key
`ssh -i key_file user@remoteserver`
## remove old fingerprint
`ssh-keygen -R hostname/ip`
## remove all fingerprints
`sudo rm ~/.ssh/known_hosts`
## execute command on remote server
`ssh user@remoteserver command`
## command redirect
`ssh user@remoteserver 'command(s)' > destination-file`
## execute multiple commands on remote server
`ssh user@remoteserver 'command;uname;who'`

# copy public key to remote server
`ssh-copy-id -i ~/.ssh/mykey.pub user@remote-server`
## or
`cat ~/.ssh/mykey.pub | ssh remote-server "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys"`
## or
`ssh-copy-id user@remoteserver`
## public key location on remote server
`~/.ssh/authorized_keys`

# copy files using SCP to remote server
## basic usage for file copy
`scp src_dir remote_server:remote_dir`
## copy dirs recursively and preserve permissions using r and p flags respectively
`scp -pr src_dir remote_server:remote_dir`

## ssh daemon
## config file daemon
`sudo vim /etc/ssh/sshd_config`
## config file client
`sudo vim /etc/ssh/ssh_config`
## confid d directory
`/etc/ssh/sshd_config.d`
## manual
`man sshd_config`
## reload ssh daemon after config changes
`sudo systemctl reload ssh.service`

# ssh client
## directory - linux
`~/.ssh`
## directory - windows
`c:/users/username`
## view manual for custom ssh config file
`man ssh_config`
## create config file -custom setting
`vim ~/.ssh/config`
```
Host ubuntu-vm
        HostName 10.0.0.186
        Port 22
        User jeremy
```
## change permisions
`sudo chmod 600 ~/.ssh/config`
## ssh client global settings file
`vim ~/etc/ssh/ssh_config`
## best practice is to add config settings file in directory
`vim ~/etc/ssh/ssh_config.d`


