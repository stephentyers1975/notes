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
## show attribute values of providers output
`terraform show`
## output all the values of the output variables defined in the configuration directory
`terraform output`
## output specific output variable value
`terraform output pet-name`

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

# Multi-providers
```
resource "local_file" "pet" {
    filename = "/root/pets.txt"
    content = "We love pets!"
}
resource "random_pet" "my-pet" {
    prefix = "Mrs"
    separator = "."
    length = "1"
}

```

# input varaibles

* variables.tf
```
variable "filename" {
    default = "/root/pets.txt"
}
variable "content" {
    default = "we love pets"
}
variable "prefix" {
    default = "mrs"
}
variable "separator" {
    default = "."
}
variable "length" {
    default = "1"
}
```
- Use in main.tf with var.variable_name
```
resource "random_pet" "my-pet" {
    prefix = var.prefix
    separator = var.separator
    length = var.length
}
```
# variable block
## parameters
* default -> default value
* type -> string, number, any, list, map, set, object, tuple or boolean
* description -> optional description for readability

## list
```
variable "prefix" {
    default = ["Mr", "Mrs", "Sir"]
    type = list(string)
}

resource "random_pet" "my-pet" {
    prefix = var.prefix[0]
}
```
### map -> key/value pairs
```
variable "file-content" {
    type = map(string)
    default = {
        "statement1" = "We love pets!"
        "statement2" = "We love animals!"
    }
}

resource local_file my-pet {
    filename = "/root/pets.txt"
    content = var.file-content["statement2"]
}
```
### set -> can't have duplicate members
```
variable "prefix" {
    default = ["Mr", "Mrs", "Sir"]
    type = set(string)
}
```
### Objects -> complex data structure
```
variable "bella" {
    type = object({
        name = string
        color = string
        age = number
        food = list(string)
        favourite_pet = bool
    })

    default = {
        name = "bella"
        color = "brown"
        age = 7
        food = ["fish", "chicken", "turkey"]
        favourite_pet = true
    }
}
```
### tuple -> like list but can use different variable types

```
variable "kitty" {
    type = tuple([string, number, bool])
    default = ["cat", 7, true]
}
```
* if no default values are supplied for variables terraform will prompt for values after "terraform apply" in interactive mode
* you can also specify variables inline during the terraform apply command
`terraform apply -var "filename=/root/pets.txt" -var "content=We love pets!" -var "prefix=Mrs" -var "separator=." -var "length=2"`
* make use of environment variables
```
export TF_VAR_filename="/root/pets.txt"
export TF_VAR_content="We love pets!"
export TF_VAR_prefix="Mrs"
export TF_VAR_separator="."
export TF_VAR_length="2"
terraform apply
```

### variable definition files -> assigned/passed in values of variables defined in variables.tf block
* terraform.tfvars | terraform.tfvars.json | *.auto.tfvars | *.auto.tfvars.json -> auto loaded with terraform apply
* any other filename not in above list like variables.tfvars must be past with terraform apply -var-file file_name flag
```
filename = "/root/pets.txt"
content = "We love pets!"
prefix = "Mrs"
separator = "."
length = "2"
```
`terraform apply`

### variable definition precedence -> 4 the highest
1. Environment variables
2. terraform.tfvars
3. *.auto.tfvars (alphabetical order)
4. Command line flags-> -var or -var-file

# Resource Attributes
## Reference Attributes

```
resource local_file pet {
    filename = var.filename
    content = "My favourite pet is ${random_pet.my-pet.id}"
}

resource "random_pet" "my-pet" {
    prefix = var.prefix
    separator = var.separator
    length = var.length
}

```
```
 resource "time_static" "time_update" {
}

resource local_file time {
    filename = "/root/time.txt"
    content = "Time stamp of this file is  ${time_static.time_update.id}"
}
```
## Resource dependencies
* implicit dependies between resources -> Terraform works out itself
* explicit -> using depends on block within a resource as below
```
resource local_file pet {
    filename = var.filename
    content = "My favourite pet is Mr. cat"

    depends_on = [
        random_pet.my-pet
    ]
}

resource "random_pet" "my-pet" {
    prefix = var.prefix
    separator = var.separator
    length = var.length
}

```
```
resource "tls_private_key" "pvtkey" {
  algorithm = "RSA"
  rsa_bits = 4096
}

resource local_file key_details {
  filename = "/root/key.txt"
  content = tls_private_key.pvtkey.private_key_pem

  depends_on = [ tls_private_key.pvtkey ]
}
```
```
resource local_file whale {
  filename = "/root/whale"
  content = "whale"
  depends_on = [ local_file.krill ]
}

resource local_file krill {
  filename = "/root/krill"
  content = "krill"
}
```

# Output variables
```
resource local_file pet {
    filename = var.filename
    content = "My favourite pet is ${random_pet.my-pet.id}"
}

resource "random_pet" "my-pet" {
    prefix = var.prefix
    separator = var.separator
    length = var.length
}

output "pet-name" {
    value = random_pet.my-pet.id
    description = "Record the value of pet ID generated by the random_pet resource"
}

```
```
resource "random_pet" "my-pet" {

  length    = var.length 
}

output "pet-name" {
	
	value = random_pet.my-pet.id
	description = "Record the value of pet ID generated by the random_pet resource"
}

resource "local_file" "welcome" {
    filename = "/root/message.txt"
    content = "Welcome to Kodekloud."
}

output "welcome_message" {
  value = local_file.welcome.content
  description = "welcome message"
}
```