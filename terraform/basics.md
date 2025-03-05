# Terraform basics

* init
* plan
* apply
* .tf file extension
* Resource -> object that Terraform manages
* HCL -> Hashicorp configuration language

```
<block> <parameters> {
    key1 = value1
    key2 = value2
}

* local.tf
resource "local_file" "pet" {
    filename = "/root/pets.txt"
    content = "We love pets!"
}
```
* resource -> Block name
* "local_file" -> Resource type -> local=provider name file=resource
* "pet" -> Resource Name
* filename = "/root/pets.txt" & content = "We love pets!" -> arguments (key/value)

# install
* binary
* package manager

# 4 steps to deploy terraform code
1. Write the configuration file
2. run the terraform init command
3. review the execution pland by using the terraform plan command
4. apply changes using terraform apply

# Basic commands

## check version
`terraform version`
## initialise directory with configuration file in
`terraform init`
## show execution plan
`terraform plan`
## execute plan and create resources
`terraform apply`
## show details of resource just created
`terraform show`
## delete infrastructure in the current configuration directory
`terraform destroy`

# Terraform Providers

* available in Terraform registry
* official
* Partner
* Community
* Downloaded into hidden directory .terraform/plugins

* registry.terraform.io/hashicorp/local -> optional hostname, Organizational namespace, type

# Configuration Directory

* main.tf -> Main configuration file containing resource defintions
* variables.tf -> Contains variable declarations
* outputs.tf -> Contains outputs from resources
* providers.tf -> Contains Provider defintions







