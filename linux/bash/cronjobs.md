# CRON jobs (crond service)

image[cron reference](/images/cron.png)
## edit cron jobs
`crontab -e`
## tab fields
`minute hour day month weekday`
## frequency
### all the time
`*`
### every 2 mins
`*/2`
### everyday at 9pm
`00 21 * * *`
## list all jobs
`crontab -l`
## inspect job status
`tail /var/log/syslog`
