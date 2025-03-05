# Create a Docker Network

The Nautilus DevOps team needs to set up several docker environments for different applications. One of the team members has been assigned a ticket where he has been asked to create some docker networks to be used later. Complete the task based on the following ticket description:

a. Create a docker network named as media on App Server 2 in Stratos DC.

b. Configure it to use macvlan drivers.

c. Set it to use subnet 172.28.0.0/24 and iprange 172.28.0.0/24.

## create neteork to spec
`docker network create media --driver macvlan --ip-range 172.28.0.0/24 --subnet 172.28.0.0/24`