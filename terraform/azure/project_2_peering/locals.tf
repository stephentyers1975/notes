locals {
  vnet_peering_pairs = {
    "vnet0_to_vnet1" = {
      source_vnet_index = 0
      target_vnet_index = 1
    }
    "vnet1_to_vnet0" = {
      source_vnet_index = 1
      target_vnet_index = 0
    }
  }
}

