# Services commands
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
## disable a service
`systemctl disable httpd`
## enable a service
`systemctl enable httpd`
## restart a service without interupting normal functionality
`systemct reload httpd`
## restart a service with interuption
`systemct restart httpd`
## edit service
`systemctl edit example_service --full`
## get default target
`systemctl get-default`
## list all service units
`systemctl list-units --all`
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
 
 