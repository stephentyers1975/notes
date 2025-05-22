variable "region" {
  default     = "uksouth"
  description = "region for infrastructure"
}

variable "resource_prefix" {
  default     = "game"
  description = "default prefix for infra"
}

variable "environment" {
  type        = string
  description = "environment name"
  default     = "dev"
  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Enter the valid value for environment"
  }
}

variable "vm_sizes" {
  type = map(string)
  default = {
    "dev"     = "standard_D2s_v3",
    "staging" = "standard_D4s_v3",
    "prod"    = "standard_D8s_v3"
  }
}

