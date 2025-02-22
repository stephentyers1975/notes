# SElinux Installation and Configuration
Install the required SELinux packages.

Permanently disable SELinux for the time being; it will be re-enabled after necessary configuration changes.

No need to reboot the server, as a scheduled maintenance reboot is already planned for tonight.

Disregard the current status of SELinux via the command line; the final status after the reboot should be disabled.

`sudo dnf install policycoreutils policycoreutils-python-utils selinux-policy selinux-policy-devel`

```
### permantly disable
`/etc/selinux/config`
`SELinux status:                 disabled`
```