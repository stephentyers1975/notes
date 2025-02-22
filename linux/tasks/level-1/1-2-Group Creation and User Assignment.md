# Group Creation and User Assignment
a. Create a group named nautilus_admin_users across all App servers within the Stratos Datacenter.
b. Add the user stark into the nautilus_admin_users group on all App servers. If the user doesn't exist, create it as well.
## steps
`groupadd nautilus_admin_users`
`useradd stark`
`usermod -aG nautilus_admin_users stark`
## check
`id stark`