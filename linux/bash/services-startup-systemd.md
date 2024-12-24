# Init System - units
* Service
* Socket
* Device
* Timer

# Services commands and systemD targets
## check systemd service manual
`man systemd.service`
## start a service
`service httpd start`  
`systemctl start httpd`
## stop a service
`systemctl stop httpd`
## check status of a service
`systemctl status httpd` 
## enable a service  
`systemctl enable httpd`
## disable a service  
`systemctl disable httpd`
## enable and start a service on non-debian OS
`systemctl enable --now httpd`
## disable and stop a service on non-debian OS
`systemctl disable --now httpd`
## check if service is enabled  
`systemctl is-enabled httpd`
## restart a service gracefully without interupting normal functionality
`systemct reload httpd`
## restart a service forced with interuption
`systemct restart httpd`
## restart a service gracefully before trying forced restart
`systemct reload-or-restart httpd`
## view service unit config file
`systemctl cat ssh.service`
## edit service
`systemctl edit --full example_service`
## revert service back to default
`systemctl revert example_service`
## mask a service so it can't be started or enabled
`systemctl mask service_name`
## unmask a service 
`systemctl unmask service_name`
## get default systemD target
`systemctl get-default`
## change default systemd target
`systemctl set-default mult-user.target`
## list all service units
`systemctl list-units --all`
### or
`systemctl list-units --type service --all`

# Create custom service
## services directory
`/etc/systemd/system`
## create service file example my_app.service
[Unit]  
Description=My python web application  
[Service]  
ExecStart=/usr/bin/python3 /opt/code/my_app.py  
ExecStartPre=/opt/code/configure_db.sh  
ExecStartPost=/opt/code/email_status.sh  
Restart=always  
[Install] WantedBy=multi-user.target
## reload daemon after changes to service unit file
`systemctl daemon-reload`
## start service
`systemctl start my_app`
## enable service
`systemctl enable my_app`
## example docker service unit file in /etc/systemd/system/docker.service
[Unit]  
Description=Docker Application Container Engine Documentation=https://docs.docker.com  
BindsTo=containerd.service  
After=network-online.target firewalld.service containerd.service Wants=network-online.target
Requires=docker.socket  

[Service]  
Type=notify  
ExecStart=/usr/bin/dockerd -H fd:// --containerd=/run/containerd/containerd.sock   
ExecReload=/bin/kill -s HUP $MAINPID  
Restart=always  
StartLimitBurst=3  
StartLimitInterval=60s  
LimitNOFILE=infinity  
LimitNPROC=infinity  
LimitCORE=infinity    

[Install] WantedBy=multi-user.target

## another example service unit file /etc/systemd/system/project-example.service
[Unit] 
Description=python test app
Documentation=http://docrepo.com
After=postgresql.service
[Service]
ExecStart= /bin/bash /usr/bin/project-mercury.sh
User=project_mercury
Restart=on-failure
RestartSec=10
[Install]
WantedBy=graphical.target

# journalctl command
## show all log entries old to newest
`journalctl`
## show all log entriess from current boot
`journalctl -b`
## show aspecific service log entriess f
`journalctl -u example.service`
 
 