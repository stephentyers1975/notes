# Tasks

* CRON
* ANACRON
* AT

!["scheduled jobs type"](/images/scheduledjobs.png)
## cron job format - system wide table
`cat /etc/crontab`
## table format
```
# Example of job definition:
# .---------------- minute (0 - 59)
# |  .------------- hour (0 - 23)
# |  |  .---------- day of month (1 - 31)
# |  |  |  .------- month (1 - 12) OR jan,feb,mar,apr ...
# |  |  |  |  .---- day of week (0 - 6) (Sunday=0 or 7) OR sun,mon,tue,wed,thu,fri,sat
# |  |  |  |  |
# *  *  *  *  * user-name  command to be executed
```
## edit cron file of current user
`crontab -e`
## view current user cron jobs
`crontab -l`
## view root user cron jobs
`sudo crontab -l`
## edit crontab of specific user 
`sudo crontab -e -u user_name`
## remove current user crontab
`crontab -r`
## allow and deny files -> place usernames inside
`cron.allow`
`cron.deny`
## remove different user crontab
`sudo crontab -r -u user_name`
## example job
```
0 8 * * * /home/bob/welcome.sh
0 6,23 * * 0 sudo systemctl restart nginx
```

# Crontab special directories - copy shell script into respective directory to run
* daily = /etc/cron.daily
* hourly = /etc/cron.hourly
* weekly = /etc/cron.weekly
* monthly = /etc/cron.monthly

## steps to use special directories
* don't use extension on shell script for crontab job
* touch shell_scrip
* sudo cp shellscript /etc/cron.hourly 
* sudo chmod +rx /etc/cron.hourly/shell_script
* sudo rm /etc/cron.hourly/shell_script

## create/edit anacron job
`sudo vi /etc/anacrontab`
## test anacrontab for errors in syntax
`anacron -T`
## check anacron job log
`cat /var/log/cron`
## force anacron jobs to run
`sudo -n -f anacron`
## example daily job entry for anacrontab file - runs every 10 days with 5 minute delay, job id db_cleanup
`10 5 db_cleanup /usr/bin/touch /root/anacron_created_this`

## create/edit at job
`at 15:00`
`at 'August 20 2024'`
`at '14:30 August 20 2024'`
`at 'now + 30 minutes'`
`at 'now + 3 hours'`
`at 'now + 3 days'`
`at 'now + 3 weeks'`
`at 'now + 3 months'`
* enter commands line by line and terminate with ctrl-d
## view sceduled at jobs
`atq`
## view detail of specific at jobs
`at -c job_num`
## remove at job
`atrm job_num`


