# Copy File to Docker Container
Copy an encrypted file /tmp/nautilus.txt.gpg from the docker host to the ubuntu_latest container located at /home/. Ensure the file is not modified during this operation
`docker cp /tmp/nautilus.txt.gpg ubuntu_latest:/home/`
