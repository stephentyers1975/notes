# Create a Cron Job
a. Install cronie package on all Nautilus app servers and start crond service.
b. Add a cron */5 * * * * echo hello > /tmp/cron_text for root user.
## switch to root
`sudo -i`
## install cronie
`yum install cronie`
## start service
`systemctl start crond`
## enable service
`systemctl enable crond`
## edit crontab
`crontab -e`
## insert into file
`*/5 * * * * echo hello > /tmp/cron_text`
