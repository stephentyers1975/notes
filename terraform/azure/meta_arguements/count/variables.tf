variable "environment" {
  type        = string
  default     = "staging"
  description = "environment type"
}

variable "storage_disk" {
  type        = number
  default     = 80
  description = "storage size of os disk"
}

variable "is_delete" {
  type        = bool
  description = "the default behaviour to os disk upon vm deletion"
  default     = true
}

variable "allowed_locations" {
  type        = list(string)
  description = "list of allowed locations"
  default     = ["West Europe", "North Europe", "East US"]
}

variable "resource_tags" {
  type        = map(string)
  description = "tags to apply to resources"
  default = {
    "environment" = "staging"
    "managed_by"  = "terraform"
    "department"  = "devops"
  }
}

variable "network_config" {
  type        = tuple([string, string, number])
  description = "Network configuration (VNET address, subnet address, CIDRmask)"
  default     = ["10.0.0.0/16", "10.0.2.0", 24]
}

# only unique values
variable "allowed_vm_sizes" {
  type        = list(string)
  description = "Allowed vm sizes"
  default     = ["Standard_DS1_v2", "Standard_DS2_v2", "Standard_DS3_v2"]
}

variable "vm_config" {
  type = object({
    size      = string
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })
  description = "virtual machine configuration"
  default = {
    size      = "Standard_DS1_v2"
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}

variable "storage_account_name" {
  type    = list(string)
  description = "list of storage account name"
  default = ["stephentyerstorage1", "stephentyerstorage2"]
}