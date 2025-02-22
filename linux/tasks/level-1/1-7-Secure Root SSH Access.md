# Secure Root SSH Access
Your task is to disable direct SSH root login on all app servers within the Stratos Datacenter
`vi /etc/ssh/sshd_config`
## change setting
`PermitRootLogin no`
## restart sshd service
`systemctl restart sshd.service`