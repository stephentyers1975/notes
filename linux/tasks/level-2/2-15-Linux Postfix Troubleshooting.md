# Linux Postfix Troubleshooting
Some users of the monitoring app have reported issues with xFusionCorp Industries mail server. They have a mail server in Stork DC where they are using postfix mail transfer agent. Postfix service seems to fail. Try to identify the root cause and fix it.
`systemctl status postfix`
## check service logs
`journalctl -xeu postfix.service`
## check main.cf file
`vi /etc/postfix/main.cf`
## comment out below
`#inet_interfaces = localhost`
## enable and start postfix service
`systemctl enable --now postfix`