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

# Generat CSR
`openssl req -newkey rsa:2048 -keyout PRIVATEKEY.key -out MYCSR.csr`

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
