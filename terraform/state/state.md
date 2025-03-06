# state
* terrafor.tfstate -> consequence of terrform apply command
* complete record of infrastructure created by terraform
* single source of truth
* terraform plan will compare the state file against the resource configuration files and show the differences
* terraform apply makes the changes and updates the state file so it's in sync with the configuration

# Purpose of state

* tracks metadata between resources and dependencies
* performance/speed -> state file can be used as single source of truth so terraform doesn't have reconcile resource attribute values of various providers data in real time as the attribute values are cached in the state file
* collaboration -> Store in remote filesystem like AWS S3, Azure blob container storage, Google cloud storage, Terraform cloud

# force terraform to use state file instead of provider refresh/reconcilation
`terraform plan --refresh=false`

# considerations
* contains sensitive information
* store configuration files in remote repos like github, gitlab etc..
* store state in secure remote encrypted storage like AWS S3, Azure blob container storage, Google cloud storage, Terraform cloud
* do not edit the state file ourselves, there are terraform state dedicated commands for this if needed
