# Integrating Virtual Machines with Application Load Balancer
Set up an Azure Load Balancer named datacenter-lb.
Configure the Load Balancer’s frontend IP configuration with the name datacenter-lb-ip and assign a public IP address with the same name (datacenter-lb-ip).
Create a backend pool named datacenter-backend-pool and add the VM running Nginx to this pool.
Create a health probe named datacenter-health-probe on port 80 to check the VM's health.
Set up a load balancer rule named datacenter-lb-rule to route traffic on port 80 to the backend pool on port 80.
Add an inbound rule to the existing NSG of the VM to allow HTTP traffic on port 80.
* complete in portal
## ARM template

{
    "$schema": "http://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#",
    "contentVersion": "1.0.0.0",
    "parameters": {
        "name": {
            "type": "String"
        },
        "location": {
            "type": "String"
        },
        "sku": {
            "type": "String"
        },
        "tier": {
            "type": "String"
        }
    },
    "resources": [
        {
            "type": "Microsoft.Network/loadBalancers",
            "apiVersion": "2023-02-01",
            "name": "[parameters('name')]",
            "location": "[parameters('location')]",
            "dependsOn": [
                "Microsoft.Network/publicIPAddresses/datacenter-lb-ip"
            ],
            "tags": {},
            "sku": {
                "name": "[parameters('sku')]",
                "tier": "[parameters('tier')]"
            },
            "properties": {
                "frontendIPConfigurations": [
                    {
                        "name": "datacenter-lb-ip",
                        "properties": {
                            "publicIPAddress": {
                                "id": "/subscriptions/a2b28c85-1948-4263-90ca-bade2bac4df4/resourceGroups/kml_rg_main-397c1541efe14cb6/providers/Microsoft.Network/publicIPAddresses/datacenter-lb-ip"
                            }
                        }
                    }
                ],
                "backendAddressPools": [
                    {
                        "name": "datacenter-backend-pool"
                    }
                ],
                "probes": [
                    {
                        "id": "/subscriptions/a2b28c85-1948-4263-90ca-bade2bac4df4/resourceGroups/kml_rg_main-397c1541efe14cb6/providers/Microsoft.Network/loadBalancers/datacenter-lb/probes/datacenter-health-probe",
                        "name": "datacenter-health-probe",
                        "properties": {
                            "protocol": "TCP",
                            "port": 80,
                            "requestPath": null,
                            "intervalInSeconds": 5,
                            "numberOfProbes": 1
                        }
                    }
                ],
                "loadBalancingRules": [
                    {
                        "name": "datacenter-lb-rule",
                        "properties": {
                            "frontendIPConfiguration": {
                                "id": "/subscriptions/a2b28c85-1948-4263-90ca-bade2bac4df4/resourceGroups/kml_rg_main-397c1541efe14cb6/providers/Microsoft.Network/loadBalancers/datacenter-lb/frontendIPConfigurations/datacenter-lb-ip"
                            },
                            "frontendPort": 80,
                            "backendPort": 80,
                            "enableFloatingIP": false,
                            "idleTimeoutInMinutes": 4,
                            "protocol": "TCP",
                            "loadDistribution": "Default",
                            "probe": {
                                "id": "/subscriptions/a2b28c85-1948-4263-90ca-bade2bac4df4/resourceGroups/kml_rg_main-397c1541efe14cb6/providers/Microsoft.Network/loadBalancers/datacenter-lb/probes/datacenter-health-probe"
                            },
                            "disableOutboundSnat": true,
                            "enableTcpReset": false,
                            "backendAddressPools": [
                                {
                                    "id": "/subscriptions/a2b28c85-1948-4263-90ca-bade2bac4df4/resourceGroups/kml_rg_main-397c1541efe14cb6/providers/Microsoft.Network/loadBalancers/datacenter-lb/backendAddressPools/datacenter-backend-pool"
                                }
                            ]
                        }
                    }
                ],
                "inboundNatRules": [],
                "outboundRules": []
            }
        },
        {
            "type": "Microsoft.Network/publicIpAddresses",
            "apiVersion": "2022-05-01",
            "name": "datacenter-lb-ip",
            "location": "[parameters('location')]",
            "dependsOn": [],
            "tags": {},
            "sku": {
                "name": "[parameters('sku')]",
                "tier": "[parameters('tier')]"
            },
            "zones": [
                "1",
                "2",
                "3"
            ],
            "properties": {
                "publicIPAddressVersion": "IPv4",
                "publicIPAllocationMethod": "Static",
                "idleTimeoutInMinutes": 4
            }
        },
        {
            "type": "Microsoft.Resources/deployments",
            "apiVersion": "2017-05-10",
            "name": "NicUpdate-1ab4f75d-10d6-4fb8-b5d7-12b368190962-20250226111852",
            "dependsOn": [
                "Microsoft.Network/loadBalancers/datacenter-lb"
            ],
            "properties": {
                "expressionEvaluationOptions": {
                    "scope": "inner"
                },
                "mode": "Incremental",
                "parameters": {},
                "template": {
                    "$schema": "http://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#",
                    "contentVersion": "1.0.0.0",
                    "parameters": {},
                    "variables": {},
                    "resources": [
                        {
                            "apiVersion": "2022-11-01",
                            "type": "Microsoft.Network/networkInterfaces",
                            "name": "datacenter-vmVMNic",
                            "location": "eastus",
                            "properties": {
                                "provisioningState": "Succeeded",
                                "resourceGuid": "903147ea-4d92-4642-b25f-8d18af2b9633",
                                "ipConfigurations": [
                                    {
                                        "name": "ipconfigdatacenter-vm",
                                        "id": "/subscriptions/a2b28c85-1948-4263-90ca-bade2bac4df4/resourceGroups/kml_rg_main-397c1541efe14cb6/providers/Microsoft.Network/networkInterfaces/datacenter-vmVMNic/ipConfigurations/ipconfigdatacenter-vm",
                                        "etag": "W/\"dd7ca622-0a65-41e4-ae92-66073049edfc\"",
                                        "type": "Microsoft.Network/networkInterfaces/ipConfigurations",
                                        "properties": {
                                            "provisioningState": "Succeeded",
                                            "privateIPAddress": "10.0.0.4",
                                            "privateIPAllocationMethod": "Dynamic",
                                            "publicIPAddress": {
                                                "id": "/subscriptions/a2b28c85-1948-4263-90ca-bade2bac4df4/resourceGroups/kml_rg_main-397c1541efe14cb6/providers/Microsoft.Network/publicIPAddresses/datacenter-vmPublicIP"
                                            },
                                            "subnet": {
                                                "id": "/subscriptions/a2b28c85-1948-4263-90ca-bade2bac4df4/resourceGroups/kml_rg_main-397c1541efe14cb6/providers/Microsoft.Network/virtualNetworks/datacenter-vmVNET/subnets/datacenter-vmSubnet"
                                            },
                                            "primary": true,
                                            "privateIPAddressVersion": "IPv4",
                                            "loadBalancerBackendAddressPools": [
                                                {
                                                    "id": "/subscriptions/a2b28c85-1948-4263-90ca-bade2bac4df4/resourcegroups/kml_rg_main-397c1541efe14cb6/providers/Microsoft.Network/loadBalancers/datacenter-lb/backendAddressPools/datacenter-backend-pool"
                                                }
                                            ],
                                            "loadBalancerInboundNatRules": []
                                        }
                                    }
                                ],
                                "dnsSettings": {
                                    "dnsServers": [],
                                    "appliedDnsServers": [],
                                    "internalDomainNameSuffix": "s3ah3o0jv31epbgcpuugzrhg0f.bx.internal.cloudapp.net"
                                },
                                "macAddress": "7C-1E-52-80-E5-16",
                                "enableAcceleratedNetworking": false,
                                "vnetEncryptionSupported": false,
                                "enableIPForwarding": false,
                                "disableTcpStateTracking": false,
                                "networkSecurityGroup": {
                                    "id": "/subscriptions/a2b28c85-1948-4263-90ca-bade2bac4df4/resourceGroups/kml_rg_main-397c1541efe14cb6/providers/Microsoft.Network/networkSecurityGroups/datacenter-vmNSG"
                                },
                                "primary": true,
                                "virtualMachine": {
                                    "id": "/subscriptions/a2b28c85-1948-4263-90ca-bade2bac4df4/resourceGroups/kml_rg_main-397c1541efe14cb6/providers/Microsoft.Compute/virtualMachines/datacenter-vm"
                                },
                                "hostedWorkloads": [],
                                "tapConfigurations": [],
                                "nicType": "Standard",
                                "allowPort25Out": false,
                                "auxiliaryMode": "None",
                                "auxiliarySku": "None"
                            },
                            "tags": {}
                        }
                    ],
                    "outputs": {}
                }
            },
            "resourceGroup": "kml_rg_main-397c1541efe14cb6"
        }
    ]
}