# Remote State
* Remote backends
* suports locking, encryption and conssistency of state

# Remote backend using AWS S3
* S3 bucket
* Dynamo DB table

```
main.tf

resource "local_file" "pet" {
    filename = "/root/pets.txt"
    content = "we love pets"
}
```
```
terraform.tf

terraform {
    backend "s3" {
        bucket = "kodekloud-terraform-state-bucket01"
        key = "finance/terraform.tfstate"
        region = "us-west-1"
        dynamodb_table = "state-locking"
    }
}
```
## rerun terraform init to use new backend withoption to copy any local state across to remote.
`terraform init`
## delete local state file
`rm -rf terraform.tfstate`
## remote state will be pulled into memory and locked until finished
`terraform apply`

### minio backend config
```
terraform {
  backend "s3" {
    key = "terraform.tfstate"
    region = "us-east-1"
    bucket = "remote-state"
    endpoint = "http://172.16.238.105:9000"
    force_path_style = true


    skip_credentials_validation = true

    skip_metadata_api_check = true
    skip_region_validation = true
  }
}
```
# Terraform state commands
* terraform state <subCommand> [options] [args]
## list all resources recorded in state
`terraform state list` -> list all
`terraform state list <resource_address>` -> list particular
## show attributes of particular resource
`terraform state show <resource_address>`
## move items within a terraform state file(rename) or from one state file to another
`terraform state mv [options] SOURCE DESTINATION`
## pull state data as json
`terraform state pull`
## filter state json file with jq tool
`terraform state pull | jq '.resources[] | select(.name == "state-locking-db")| .instances[].attributes.hash_key'`
## delete items from state file -> make sure removed from resource file too
* items removed from state are not destoryed in real life, they are merely not managed by terraform anymore
`terrform state rm ADDRESS`

