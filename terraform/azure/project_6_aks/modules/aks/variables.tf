variable "location" {

}
 variable "resource_group_name" {}

variable "service_principal_name" {
  type = string
}

# variable "ssh_public_key" {
#   default = "~/.ssh/id_rsa.pub"
# }

variable "client_id" {}
variable "client_secret" {
  type = string
  sensitive = true
}

variable "ssh_public_key" {
  description = "The SSH public key to authorize for AKS node access."
  type        = string
  sensitive   = false # Public key is not sensitive
}