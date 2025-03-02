# Haproxy LBR Troubleshooting
xFusionCorp Industries has an application running on Nautlitus infrastructure in Stratos Datacenter. The monitoring tool recognised that there is an issue with the haproxy service on LBR server. That needs to fixed to make the application work properly.

Troubleshoot and fix the issue, and make sure haproxy service is running on Nautilus LBR server. Once fixed, make sure you are able to access the website using StaticApp button on the top bar.

## start proxy
`systemctl start haproxy`
## view status of proxy
`systemctl start haproxy`
## view logs of service to find issue
`journalctl -xeu haproxy.service`
## found error
`Proxy 'main': unable to find required default_backend: 'app'.`
## edit proxy config file and removed comment on backend configuration
`vi /etc/haproxy/haproxy.cfg`
## restart service
`systemctl restart haproxy`