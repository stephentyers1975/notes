locals {
  # NSG rule config
  nsg_rules = {
    "allow_http" = {
      priority               = 100
      protocol               = "Tcp"
      destination_port_range = "80"
      destination_application_security_group_ids = [azurerm_application_security_group.web_asg.id]
      description            = "Allow HTTP"
    },
    "allow_https" = {
      priority               = 101
      protocol               = "Tcp"
      destination_port_range = "443"
      destination_application_security_group_ids = [azurerm_application_security_group.web_asg.id]
      description            = "Allow HTTPS"
    },
    "allow_ssh" = {
      priority               = 102
      protocol               = "Tcp"
      destination_port_range = "22"
      destination_application_security_group_ids = [azurerm_application_security_group.web_asg.id]
      description            = "Allow SSH"
    }
  }

  # timestamp generation
  current_time = timestamp()
  tag_date     = formatdate("YY-MM-DD", local.current_time)
  tag_modified = local.tag_date

  #tags
  # Define your common, dynamic tags here
  common_tags = {
    Environment  = var.environment
    ManagedBy    = "Terraform"
    ModifiedDate = "${local.tag_modified}" # Dynamic tag: current date
  }
}