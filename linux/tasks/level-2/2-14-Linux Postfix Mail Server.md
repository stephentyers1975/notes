# Linux Postfix Mail Server
xFusionCorp Industries has planned to set up a common email server in Stork DC. After several meetings and recommendations they have decided to use postfix as their mail transfer agent and dovecot as an IMAP/POP3 server. We would like you to perform the following steps:

1. Install and configure postfix on Stork DC mail server.

2. Create an email account john@stratos.xfusioncorp.com identified by GyQkFRVNr3.

3. Set its mail directory to /home/john/Maildir.

4. Install and configure dovecot on the same server.

## install and configure postfix
`yum install -y postfix`
`vi /etc/postfix/main.cf`
### edit /enable settings in main.cf file
```
myhostname = stmail01.stratos.xfusioncorp.com
mydomain = stratos.xfusioncorp.com
myorigin = $mydomain
inet_interfaces = all
mydestination = $myhostname, localhost.$mydomain, localhost, $mydomain
mynetworks = 172.16.238.17/24, 172.16.239.3/24,127.0.0.0/8
home_mailbox = Maildir/
```
## create user
`useradd javed`
`passwd paswoord`
## test postfix smtp
```
[root@stmail01 ~]# telnet stmail01 25
Trying 172.16.238.17...
Connected to stmail01.
Escape character is '^]'.
220 stmail01.stratos.xfusioncorp.com ESMTP Postfix
EHLO localhost
250-stmail01.stratos.xfusioncorp.com
250-PIPELINING
250-SIZE 10240000
250-VRFY
250-ETRN
250-STARTTLS
250-ENHANCEDSTATUSCODES
250-8BITMIME
250-DSN
250-SMTPUTF8
250 CHUNKING
mail from:javed@stratos.xfusioncorp.com
250 2.1.0 Ok
rcpt to:javed@stratos.xfusioncorp.com
250 2.1.5 Ok
DATA
354 End data with <CR><LF>.<CR><LF>
test mail
.
250 2.0.0 Ok: queued as 2F58D2C0DDBF
quit
221 2.0.0 Bye
Connection closed by foreign host.
```
## install and configure dovecot
`yum install -y dovecot`
`vi /etc/dovecot/dovecot.conf`
```
protocols = imap pop3 lmtp submission
```
`vi /etc/dovecot/conf.d/10-mail.conf`
```
mail_location = maildir:~/Maildir
```
`vi /etc/dovecot/conf.d/10-auth.conf`
```
disable_plaintext_auth = yes
auth_mechanisms = plain login
```
`vi /etc/dovecot/conf.d/10-master.conf`
```
unix_listener auth-userdb {
    #mode = 0666
    user = postfix
    group = postfix
  }
```
## test dovecot imap
```
[root@stmail01 ~]# telnet stmail01 110
Trying 172.16.238.17...
Connected to stmail01.
Escape character is '^]'.
+OK Dovecot ready.
user javed
+OK
pass TmPcZjtRQx
+OK Logged in.
retr 1
+OK 513 octets
Return-Path: <javed@stratos.xfusioncorp.com>
X-Original-To: javed@stratos.xfusioncorp.com
Delivered-To: javed@stratos.xfusioncorp.com
Received: from localhost (stmail01 [172.16.238.17])
        by stmail01.stratos.xfusioncorp.com (Postfix) with ESMTP id 2F58D2C0DDBF
        for <javed@stratos.xfusioncorp.com>; Fri, 28 Feb 2025 10:43:00 +0000 (UTC)
Message-Id: <20250228104308.2F58D2C0DDBF@stmail01.stratos.xfusioncorp.com>
Date: Fri, 28 Feb 2025 10:43:00 +0000 (UTC)
From: javed@stratos.xfusioncorp.com

test mail
.
quit
+OK Logging out.
Connection closed by foreign host.
```
## check network ports are listening
`ss -tulnp`


```
+OK 508 octets
Return-Path: <john@stratos.xfusioncorp.com>
X-Original-To: john@stratos.xfusioncorp.com
Delivered-To: john@stratos.xfusioncorp.com
Received: from localhost (stmail01 [172.16.238.17])
        by stmail01.stratos.xfusioncorp.com (Postfix) with ESMTP id 5793B71B3923
        for <john@stratos.xfusioncorp.com>; Fri, 28 Feb 2025 11:45:10 +0000 (UTC)
Message-Id: <20250228114528.5793B71B3923@stmail01.stratos.xfusioncorp.com>
Date: Fri, 28 Feb 2025 11:45:10 +0000 (UTC)
From: john@stratos.xfusioncorp.com

test mail
.
```

`- Mail not received!, 'dovecot' is not configured correctly on Mail Server`