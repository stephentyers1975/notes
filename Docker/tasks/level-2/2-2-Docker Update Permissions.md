# Docker Update Permissions
User kirsty is not able to run docker commands on App Server 1 in Stratos DC, make the required changes so that this user can run docker commands without sudo.
`usermod -aG docker kirsty`