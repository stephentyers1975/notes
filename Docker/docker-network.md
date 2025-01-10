# Docker Network - 
* Bridge - Usually in range 172.17.0.1 - container port map to host ports
* None - no connectivity to host
* Host - directory map containers to host 
## Associate container with network
`docker run --network=host ubuntu`

# User defined networks
## create custom network
`docker network create --driver bridge --subnet 182.18.0.0/16 custom-isolated-network`
`docker network create -d bridge --subnet 182.18.0.0/24 --gateway 182.18.0.1 wp-mysql-network`
## list all networks
`docker network ps`
## inspect in detail network
`docker inspect custom_network`
## built-in DNS server for inta network resolution
`172.0.0.11`
