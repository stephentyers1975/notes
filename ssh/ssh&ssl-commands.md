# Generate Private Public Key pair for SSH purposes
`ssh-keygen`
# View installed public keys on server
`cat ~/.ssh/authorized_keys`
# View configured hosts on server
`cat ~/.ssh/config`

# Generate Private/Public key pair with openSSL
## Generate private key
`openssl genrsa -out my-bank.key 1024`
## Generate public key using private key
`openssl rsa -in my-bank.key -pubout > mybank.pem`

# Generate CSR
`openssl req -newkey rsa:2048 -keyout PRIVATEKEY.key -out MYCSR.csr`
## or
`sudo openssl req -new -newkey rsa:2048 -nodes -keyout PRIVATEKEY.key -out MYCSR.csr`
# Generate self-signed certificate
`sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout PRIVATEKEY.key -out self-signed.crt`
## Test certificate
`echo | openssl s_client -showcerts -servername app01.com -connect app01:443 2>/dev/null | openssl x509 -inform pem`

#  Login and remote exec commands
## basic login
`ssh aparna@192.168.1.2`
## login with private key
`ssh -i key_file user@remoteserver`
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
