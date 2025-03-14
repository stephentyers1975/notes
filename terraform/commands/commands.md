# Terraform commands

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

# extra commands
## validate configuration commands
`terraform validate`
## format command -> formats code in configuration directory and formats canonically to make more readable
`terraform fmt`
## show current state of resource and all attributes created by configuration
`terraform show`
### in json format
`terraform show -json`
## show all providers in configuration directory
`terraform providers`
## copy provider configuration to new directory/paht
`terraform providers mirror new_path`
## refresh terraform state file with the real world infrastructure if for example manual changes have made outside terraforms control
`terraform apply -refresh-only`
## show visual representation of terraform execution/plan/dependencies - outputs . dot file format which can be passed to graph visualiser like graphviz
`terraform graph`
`terraform graph | dot -Tsvg > graph.svg`

# Mutable vs immutable infrastructure
* no inplace upgrades, new version is built out separately
* Terraform by default deletes old version of resource first before creating new version
* Use lifecycle rules to adjust default behaviour

# Lifecycle rules
* rules are put directly inside resource block of rules we want to change
```
resource local_file my-pet {
    filename = "/root/pets.txt"
    content = var.file-content["statement2"]
    file_permission = "0700"

    lifecycle {
        create_before_destroy = true
    }
}
```
## example rules
* create_before_destroy = true
* prevent_destroy = true
* ignore_changes = all
* ignore_changes = [list of attributes]

```
resource "aws_instance" "webserver" {
    ami = ami-0edab43b6fa892279
    instance_type = "t2.micro"
    tags = {
        Name = "ProjectA-Webserver"
    }

    lifecycle {
        ignore_changes = [
            tags, ami
            ]
    }
}
```

* terraform destroy still works, rules only affect configuration changes and applies

# Data sources -> allows Terraform to make use and read non-managed data sources
```
resource local_file pet {
    filename = "/root/pets.txt"
    content = data.local_file.dog.content
}

data "local_file" "dog" {
        filename = "/root/dog.txt"
}
```
```
data "aws_ami" "amiID" {
        most_recent = true
        filter {
            name = "name"
            values = ["ubuntu/imaes/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
        }
        filter {
            name = "virtualization=type"
            values = ["hvm"]
        }
    owners = ["099720109477"]
}

output "instance_id" {
    description = "AMI ID of Ubuntu Instance"
    value = data.aws_ami.amiID.id
}
```
# META arguements
* depends_on
* lifecycle
* count

## count
main.tf
```
resource local_file pet {
    filename = var.filename[count.index]

    count = 3
}
```
variables.tf
```
variable "filename" {
    default = [
        "/root/pets.txt",
        "/root/dog.txt",
        "/root/cats.txt"
    ]
}
```
### count example 2
main.tf
```
resource local_file pet {
    filename = var.filename[count.index]

    count = length(var.filename)
}
```
variables.tf
```
variable "filename" {
    type = list(string)
    default = [
        "/root/pets.txt",
        "/root/dog.txt",
        "/root/cats.txt",
        "/root/bird.txt",
        "/root/fox.txt"
    ]
}
```
## for_each -> only works with map or set
main.tf
```
resource local_file pet {
    filename = each.value
    for_each = var.filename
}
```
variables.tf
```
variable "filename" {
    type = list(set)
    default = [
        "/root/pets.txt",
        "/root/dog.txt",
        "/root/cats.txt"
    ]
}
```
## for-each example 2
main.tf
```
resource local_file pet {
    filename = each.value
    for_each = toset(var.filename)
}

output "pets" {
    value = local_file.pet
}
```
variables.tf
```
variable "filename" {
    type = list(string)
    default = [
        "/root/pets.txt",
        "/root/dog.txt",
        "/root/cats.txt"
    ]
}
```
# Version Constraints
main.tf
```
terraform {
    required_providers {
        local = {
            source = "hashicorp/local"
            version = "1.4.0"
        }
    }
}

resource local_file pet {
    filename = "/root/pet.txt"
    content = "We love pets"
}
```
* not equal !=
* equal =
* comaprison <= 1.2.0 >=
* combinations "> 1.2.0, < 2.0.0, != 1.4.0"
* pesermistic "~> 1.2" or "~>1.2.0"

