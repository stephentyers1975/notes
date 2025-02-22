# Temporary User Setup with Expiry
Create a user named anita on App Server 2 in Stratos Datacenter. Set the expiry date to 2024-01-28, ensuring the user is created in lowercase as per standard protocol.
`useradd --expiredate 2024-01-28 anita`
## confirm
`chage --list anita`