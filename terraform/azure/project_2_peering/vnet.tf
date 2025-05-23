#  VNET config

resource "azurerm_virtual_network" "vnet" {
  count               = var.resource_count
  name                = "peer${count.index + 1}"
  resource_group_name = azurerm_resource_group.rg-peering.name
  location            = azurerm_resource_group.rg-peering.location
  address_space       = ["10.${count.index}.0.0/16"]
}

resource "azurerm_subnet" "sn" {
  count                = var.resource_count
  name                 = "peer${count.index + 1}-sn"
  resource_group_name  = azurerm_resource_group.rg-peering.name
  virtual_network_name = azurerm_virtual_network.vnet[count.index].name
  address_prefixes     = ["10.${count.index}.0.0/24"]
  
}

# Peering Config

resource "azurerm_virtual_network_peering" "vnet_peering" {
  for_each = local.vnet_peering_pairs

  # Construct a dynamic name for the peering based on the VNet names
  name                = "${azurerm_virtual_network.vnet[each.value.source_vnet_index].name}-to-${azurerm_virtual_network.vnet[each.value.target_vnet_index].name}-peering"
  resource_group_name = azurerm_resource_group.rg-peering.name
  # Reference the source VNet by its index from the 'vnet' resource
  virtual_network_name = azurerm_virtual_network.vnet[each.value.source_vnet_index].name
  # Reference the remote VNet's ID by its index from the 'vnet' resource
  remote_virtual_network_id = azurerm_virtual_network.vnet[each.value.target_vnet_index].id

  # Peering configuration options
  allow_virtual_network_access = true  # Allow traffic between the peered networks
  allow_forwarded_traffic      = true  # Allow traffic forwarded from other networks (e.g., VPN gateways)
  allow_gateway_transit        = false # Do not allow this VNet to use the remote gateway
  use_remote_gateways          = false # Do not use the remote VNet's gateway
}

# resource "azurerm_virtual_network_peering" "peer2to1" {
#   name                      = "peer2to1"
#   resource_group_name       = azurerm_resource_group.rg-peering.name
#   virtual_network_name      = azurerm_virtual_network.vnet2.name
#   remote_virtual_network_id = azurerm_virtual_network.vnet1.id
# }