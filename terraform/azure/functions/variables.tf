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