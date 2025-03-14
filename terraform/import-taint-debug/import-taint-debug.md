# Taints
## mark resource as tainted to recreate without destroying first
`terraform taint aws_instance.webserver`
## untaint
`terraform untaint aws_instance.webserver`

# Debugging
## set environment variable for logging
* 5 levels
* INFO, WARNING, ERROR, DEBUG, TRACE
`export TF_LOG=TRACE`
## store logs permanently in a file
`export TF_LOG_PATH=/tmp/terraform.log`

## Terraform Import -> bring resources created by other methods under terraform control

* syntax -> terraform import <resource_type>.<resource_name> <attribute>
`terraform import aws_instance.webserver-2 i-026e13be10d5326f7`
* first time run you will see an error as terraform import does not update the configuration files with the new imported resource, it only updates the state. You must manually put in an empty resource block with the correct name to correct the error
* file in the attribute details for data in the state file of the current cloud provider


