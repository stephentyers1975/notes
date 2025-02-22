# File Permission Correction
The file named /etc/hostname on Nautilus App 2 server requires adjustments to its Access Control Lists (ACLs) as follows:

1. The file's user owner and group owner should be set to root.

2. Others should possess read only permissions on the file.

3. User ravi must not have any permissions on the file.

4. User garrett should be granted read only permission on the file.

## check Advanced file permissions
`getfacl /etc/hostname`
## modify permissions
`setfacl --modify user:ravi:--- /etc/hostname`
`setfacl --modify user:garrett:r /etc/hostname`