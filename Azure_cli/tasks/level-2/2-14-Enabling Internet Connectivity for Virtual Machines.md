# Enabling Internet Connectivity for Virtual Machines
The Nautilus DevOps team has encountered an issue with an Azure VM named datacenter-vm. They are unable to install any packages on this VM due to connectivity issues. The team needs to identify the root cause of the problem and resolve it to restore normal operations.

Investigate the connectivity issue preventing package installation on the Azure VM datacenter-vm.
Implement a solution to resolve the connectivity issue and restore package installation capabilities on the VM.
Note: The SSH key required to access the Azure VM is already created and added to the VM's authorized keys. You can find the SSH key at /root/.ssh/id_rsa on the azure-client host.
* removed block all outbound rule from nsg assigned to VM NIC