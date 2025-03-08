# AWS with Terraform
# IAM
* setup credntials
* region
* don't hardcode credentials in tf file
* configure aws cli to create credentials file
* or create environment variables locally
```
provider "aws" {
    region = "us-west-2"
    access_key = "access_key"
    secret = "secret"
}

resource "aws_iam_user" "admin-user" {
    name = "lucy"
    tags = {
        Description = "Technical Team Leader"
    }
}
```
## .aws/credentials
```
[default]
aws_access_key_i = access_key
aws_secret_access_key_i = secret_key
```
## environment variables -> enables you to remove provide block completely from code
`export AWS_ACCESS_KEY_ID=access_key`
`export AWS_SECRET_ACCESS_KEY_ID=secret_key`
`export AWS_REGION=us-west-2`

## IAM policies -> reference policy directly in document
```
resource "aws_iam_user" "admin-user" {
    name = "lucy"
    tags = {
        Description = "Technical Team Leader"
    }
}

resource "aws_iam_policy" "adminUser" {
    name = "adminUsers"
    policy = <<EOF
    {
        "Version": "2012-10-17",
        "Statement": [
            {
                "Effect": "Allow",
                "Action": "*",
                "Resource": "*"
            }
        ]
    }
    EOF
}

resource "aws_iam_user_policy_attachment" "lucy-admin-access" {
    user = aws_iam_user.admin-user.name
    policy_arn = aws_iam_policy.adminUser.arn
}

```
## reference via file using file function
```
admin-policy.json
{
        "Version": "2012-10-17",
        "Statement": [
            {
                "Effect": "Allow",
                "Action": "*",
                "Resource": "*"
            }
        ]
}
```
```
main.tf

resource "aws_iam_user" "admin-user" {
    name = "lucy"
    tags = {
        Description = "Technical Team Leader"
    }
}

resource "aws_iam_policy" "adminUser" {
    name = "adminUsers"
    policy = file("admin-policy.json")
}
```

# S3
```
main.tf

resource "aws_s3_bucket" "finance" {
    bucket = "finance-21092020"
    tags = {
        Description = "Finance and Payroll"
    }
}

resource "aws_s3_bucket_object" "finance-2020" {
    content = "/root/finance/finance-2020.doc"
    key = "finance-2020.doc
    bucket = aws_s3_bucket.finance.id
}

data "aws_iam_group" "finance-data" {
    group_name = "finance-analysts"
}

resource "aws_s3_bucket_policy" "finance-policy" {
    bucket = aws_s3_bucket.finance.id
    policy = <<EOF
    {
        "Version": "2012-10-17",
        "Statement": [
            {
                "Effect": "Allow",
                "Action": "*",
                "Resource": "arn:aws:s3:::${aws_s3_bucket.finance.id}/*",
                "Principal": {
                    "AWS": [
                        "${data.aws_iam_group.finance-data.arn}"
                    ]
                }
            }
        ]
    }
    EOF
}
```

# DynamoDB
main.tf
```
resource "aws_dynamodb_table" "cars" {
    name = "cars"
    hash_key = "VIN"
    billing_mode = "PAY_PER_REQUEST"
    attribute {
        name = "VIN"
        type = "S"
    }
}

resource "aws_dynamodb_table_item" "cars-items" {
   table_name = aws_dynamodb_table.cars.name 
   hash_key = aws_dynamodb_table.cars.hash_key
   item = <<EOF
    {
        "manufacturer": {"S": "Toyota"},
        "Make": {"S": "Corolla"},
        "Year": {"N": 2004},
        "VIN": {"S": "4Y1SL6584Z411439"}
    }
   EOF
}
```