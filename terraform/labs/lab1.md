# lab 1 HCL basics
```
resource "local_file" "games" {
  filename     = "/root/favorite-games"
  content  = "FIFA 21"
}
```
```
resource "local_sensitive_file" "games" {
  filename     = "/root/favorite-games"
  content  = "FIFA 21"
}
```
## initialise directory with config file to download providers
`terraform init`
## create terraform plan
`terraform plan`
## apply plan to create resources
`terraform apply`
## delete infrastructure
`terraform destroy`