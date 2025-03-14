# functions
## interactive console -> loads state of config diretory and enables us to test functions, variables and interpolations
`terraform console`
```
file("/root/terraform-projects/main/tf")
length(var.region)
toset(var.region)
```

## Common built-in functions
* numberic functions
* string functions
* collection functions
* type conversion functions

### Numeric functions
`max(-1,2,3)`
`min(-1,2,3)`
`max(var.num...)`
`ceil(10.1)`
`floor(10.9)`

### String Functions
`split(",", "ami-xyz,AMI-ABC,ami-efg")`
`split(",", var.ami)`
`lower(var.ami)`
`upper(var.ami)`
`title(var.ami)`
`substr(var.ami, 8, 7)` -> offset, length from offset
`join(",", ["ami-xyz","AMI-ABC","ami-efg"])`

### collection functions
`length(var.ami)`
`index(var.ami, "AMI-ABC")`
`element(var.ami,2)`
`contains(var.ami, "AMI-ABC")`

### map data types
```
variables.tf
variable = "ami" {
    type = map
    defautl = { "us-east-1" = "ami-xyz",
    "ca-central-1" = "ami-efg",
    "ap-south-1" = "ami-ABC"}
decription = " A map of ami ids"
}
```
`terraform console`
`keys(var.ami)` -> output map keys
`values(var.ami)` -> output map value
`lookup(var.ami, "ca-central-1)` -> lookup map value of a key
`lookup(var.ami, "ca-central-1", "ami-pqr")` -> lookup map value of a key and return default value if doesn't exist

## Conditional Expressions
`terraform console` -> for testing
* numerical -> + - * /
* equality -> == !=
* comparison -> > < >= <=
* logical -> && || !
## example -> ternary operator
```
main.tf

resource "random_password" "password-generator" {
    length = var.length < 8 ? 8 : var.length
}
output password {
    value = random_password.password-generator.result
}

variables.tf
variable length {
    type = number
    description = "The length of the password"
}
```
`terraform apply -var=length=5`

# Terraform workspaces -> enables use of same configuration directory for multiple projects
## create workspace -> terraform will automatically switch to this workspace
`terraform workspace new ProjectA`
## list workspace
`terraform workspace list`
## switch to workspace -> every initialised directory has a default workspace
`terraform select workspace_name`
* individual terraform state files for workspace are stored in a named sub directory of directory terraform.tfstate.d in the configuration directory

### example -> prject A and B
```
variables.tf
variable region {
    default = "ca-central-1
}
variable instance_type {
    default = "t2.micro"
}
variable ami {
    type = map
    default = {
        "projectA" = "ami-projectA"
        "projectB" = "ami-projectB"
    }
}

main.tf
resource "aws_instance" "projectA" {
    ami = lookup(var.ami, terraform.workspace)
    instance_type = var.instance_type
    tags = {
        Name = terraform.workspace
    }
}
```
```
module "payroll_app" {
  source = "/root/terraform-projects/modules/payroll-app"
  app_region = lookup(var.region, terraform.workspace)
  ami        = lookup(var.ami, terraform.workspace)
} 
```
