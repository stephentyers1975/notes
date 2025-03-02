# Install and Configure Ha Proxy LBR
a. Install and configure HAproxy on LBR server using yum only and make sure all app servers are added to HAproxy load balancer. HAproxy must serve on default http port (Note: Please do not remove stats socket /var/lib/haproxy/stats entry from haproxy default config.).

b. Once done, you can access the website using StaticApp button on the top bar.

## install ha server
`sudo yum install haproxy -y`
## edit config file
`vi /etc/haproxy/haproxy.cfg`
## insert below config
```
#---------------------------------------------------------------------
# http frontend which proxys to the backends
#---------------------------------------------------------------------
frontend http_front
    bind *:80
    default_backend             http_back


#---------------------------------------------------------------------
# http backend round robin balancing
#---------------------------------------------------------------------
backend http_back
    balance     roundrobin
    server  stapp01.stratos.xfusioncorp.com 172.16.238.10:3000 check
    server  stapp02.stratos.xfusioncorp.com 172.16.238.11:3000 check
    server  stapp03.stratos.xfusioncorp.com 172.16.238.12:3000 check
```
## restart and enable services
`sudo systemctl start haproxy`
`sudo systemctl enable haproxy`
`sudo systemctl status haproxy`