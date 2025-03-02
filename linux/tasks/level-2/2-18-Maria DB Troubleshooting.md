# Maria DB Troubleshooting
There is a critical issue going on with the Nautilus application in Stratos DC. The production support team identified that the application is unable to connect to the database. After digging into the issue, the team found that mariadb service is down on the database server.

## check service logs after restart
`systemctl restart mariadb.service`
`journalctl -xeu mariadb.service`
## found out that mysql directory didn't exist in /var/lib directory. Create directory and setup ownership for mysql account
`mkdir /var/lib/mysql`
`chown -R mysql:mysql /var/lib/mysql`