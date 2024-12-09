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