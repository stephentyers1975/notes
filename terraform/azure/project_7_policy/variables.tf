variable "allowed_locations" {
  description = "List of Azure regions where resources are allowed to be deployed."
  type        = list(string)
  default     = ["eastus","westcentralus"]
}

variable "required_tags" {
  description = "List of tags that must exist on all resources."
  type        = list(string)
  default     = ["Department", "Project"] # Updated default to your requested tags
}

variable "vm_sizes" {
  description = "List of Azure allowed VM sizes to be deployed."
  type        = list(string)
  default     = ["Standard_B2s","Standard_B2ms"]
}
