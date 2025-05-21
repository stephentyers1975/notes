variable "project_name" {
  type = string
  description = "name of the project"
  default = "Project Alpha Resource"
}

variable "default_tags" {
  type = map(string)
  default = {
    company = "devops"
    managed_by = "terraform"
  }
}

variable "environment_tags" {
  type = map(string)
  default = {
    environment = "production"
    cost_centre = "cc-123"
  }
}

variable "storage_account_name" {
  type = string
  default = "styers-incorrect-format-1232345534"
}

variable "allowed_ports" {
  type = string
  default = "80,443,3389,22"
}

variable "envrionment_var" {
  type = string
  description = "environment name"
  default = "dev"
  validation {
    condition = contains(["dev","staging","prod"], var.envrionment_var)
    error_message = "Enter the valid value for environment"
  }
}

variable "vm_sizes" {
  type = map(string)
  default = {
    "dev" = "standard_D2s_v3",
    "staging" = "standard_D4s_v3",
    "prod" = "standard_D8s_v3"
  }
}

variable "vm_size" {
  type = string
  default = "standard_D2s_v3"
  validation {
    condition = length(var.vm_size) >=2 && length(var.vm_size) <= 20
    error_message = "The vm size should be between 2 and 20 characters"
  }
  validation {
    condition = strcontains(lower(var.vm_size), "standard")
    error_message = "The vm size should contain standard"
  }
}

variable "backup_name" {
  default = "test_backup"
  type = string
  validation {
    condition = endswith(var.backup_name, "_backup")
    error_message = "Backup should end with _backup"
  }
}

variable "credential" {
  default = "xyx23445"
  type = string
  sensitive = true
}