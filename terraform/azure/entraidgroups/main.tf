locals {
  users_data = csvdecode(file("users.csv"))

  # --- Local: Extract Unique Department Names ---
  # This local block creates a set of unique department names from the 'users_data'.
  # This is used to dynamically create one Entra ID group for each unique department.
  unique_departments = distinct([for user in local.users_data : user.department])
}

# --- Resource: Create Entra ID Users from CSV Data ---
# This resource block uses 'for_each' to create multiple 'azuread_user' resources.
# A separate user resource will be created for each entry in the 'users_data' local variable.
resource "azuread_user" "all_users" {
  # The 'for_each' meta-argument iterates over the 'users_data' list.
  # We use the 'user_principal_name' as the key for each instance, as it must be unique.
  for_each = { for user in local.users_data : user.user_principal_name => user }

  # Attributes for each user, derived from the current 'each.value' (CSV row object).
  display_name        = each.value.display_name
  user_principal_name = each.value.user_principal_name
  mail_nickname       = each.value.mail_nickname
  password            = each.value.password
  # Force password change on first login for security.
  force_password_change = true

  # Optional attributes from CSV, if present.
  # Uncomment and adjust if your CSV has these columns and you want to use them.
  department = each.value.department
  job_title  = each.value.job_title
}

# --- Resource: Create Entra ID Groups for Each Department ---
# This resource block uses 'for_each' to create one 'azuread_group' for each unique department.
resource "azuread_group" "department_groups" {
  # The 'for_each' iterates over the 'unique_departments' local.
  # The department name itself serves as the key for each group instance.
  for_each = toset(local.unique_departments) # Convert list to set for for_each

  # The display name of the group will be "Department - [Department Name]".
  display_name     = "Department - ${each.key}"
  security_enabled = true
  mail_enabled     = false
  description      = "Entra ID group for the ${each.key} department, managed by Terraform."
}

# --- Resource: Add Users to Their Respective Department Groups ---
# This resource block uses 'for_each' to create multiple 'azuread_group_member' resources.
# A separate membership will be created for each user, linking them to their department group.
resource "azuread_group_member" "user_department_memberships" {
  # The 'for_each' iterates over the 'all_users' resource, which is a map of created users.
  # The key for each membership instance is a combination of user UPN and department,
  # ensuring uniqueness for each user-group assignment.
  for_each = { for user_upn, user_obj in azuread_user.all_users : "${user_upn}-${user_obj.department}" => user_obj }

  # The object ID of the group to which the member will be added.
  # We reference the 'department_groups' resource using the user's department as the key.
  group_object_id = azuread_group.department_groups[each.value.department].object_id
  # The object ID of the member (user) to add.
  # We reference the 'object_id' of the user created by 'azuread_user.all_users'.
  member_object_id = each.value.object_id
}

# --- Output: List of Created User UPNs ---
# Displays the User Principal Names of all users created from the CSV.
output "created_user_upns" {
  description = "User Principal Names of the created Entra ID users."
  value       = [for user in azuread_user.all_users : user.user_principal_name]
}

# --- Output: List of Created Department Group Display Names ---
# Displays the display names of all department groups created.
output "created_department_groups" {
  description = "Display Names of the created Entra ID department groups."
  value       = [for group_name, group in azuread_group.department_groups : group.display_name]
}
