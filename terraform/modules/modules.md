# Modules

* root / child module
* reference directories with configuration files in as modules in new code
`mkdir /root/terraform-projects/development`
`main.tf`

```
main.tf
module "dev-webserver" {
    source = "../aws-instance"
}
```
## create a new module
### module directory
`mkdir /root/terraform-projects/modules/payrool-app`
* app_server.tf
* dynamodb.tf
* s3_bucker.tf
* variables.tf

```
app_server.tf
resource "aws_instance" "app_server" {
    ami = var.ami
    instance_type = "t2.medium"
    tags = {
        Name = "${var.app_region}-app-server"
    }
    depends_on = [ aws_dynamodb_table.payroll_db,
                   aws_s3_bucket.payroll_data
                   ]
}

s3_bucket.tf
resource "aws_s3_bucket" "payrool_data" {
    bucket = "${var.app_region}-${var.bucket}
}

dynamodb_table.tf
resource "aws_dynamodb_table" "payrool_db" {
    name = "user_data"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "EmployeeID"

    attribute {
        name = "EmployeeID"
        type = "N"
    }
}

variables.tf
variable "app_region" {
    type = string
}
varible "bucket" {
    defualt = "flexit-payroll-alpha-22001c"
}
varible "ami" {
    type = string
}
```
## Deploy in particular region
`mkdir /root/terraform-prohjects/us-payroll-app`
* main.tf
* provider.tf

```
main.tf
module "us-payroll" {
    source = "../modules/payroll-app"
    app_region = "us-east-1"
    ami = "ami-24e140119877avm"
}
```
## create another region directory
`mkdir /root/terraform-prohjects/uk-payroll-app`
* main.tf
* provider.tf
```
main.tf
module "uk-payroll" {
    source = "../modules/payroll-app"
    app_region = "eu-west-2"
    ami = "ami-35e140119877avm
}
provider.tf
provider "aws" {
    region = "eu-west-2"
}
```
## Using modules from registry
```
module "security-group-ssh" {
    source = "terraform-aws-modules/security-group/aws/modules/ssh"
    version = "3.16.0"
    # insert 2 required variables
    vpc_id = "vpc-7d8d215"
    ingress_cidr_blocks = [ "10.0.0.0/16" ]
    name = "ssh-access"
}
```
## download module from registry if provider plugins have already been downloaded vi terraform init
`terraform get`