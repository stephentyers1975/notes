# Restrict Cron Access
## please users inside respective files, create files if they don't exist
`echo "kirsty" | sudo tee -a /etc/cron.allow`
`echo "jerome" | sudo tee -a /etc/cron.deny`
## restart service
`systemctl restart crond.service`