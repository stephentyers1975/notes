# Terraform provisioners
## EC2 provisioner
main.tf
```
resource "aws_instance" "webserver" {
    ami = "ami_id"
    instance_type = "t2.micro"
    tags = {
        Name = "webserver"
        Description = "An nginx server"
    }

    user_data = <<EOF
                #!/bin/bash
                sudo apt update
                sudo apt install nginx
                systemctl enable nginx
                systemctl start nginx
                EOF
    key_name = aws_key_pair.web.id
    vpc_security_group_ids = [ aws_security_group.ssh-access.id ]
}

resource "aws_key_pair" "web" {
    public_key = file("/root/.ssh/web.pub")
}

resource "aws_security_group" "ssh-access" {
    name = "ssh-access"
    description = "Allow ssh access from the internet"
    ingress {
        from_port = 22
        to_port 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

output publicip {
    value = aws_instance.webserver.public_ip
}

provider.tf

provider "aws" {
    region = "us-west-1"
}
```
## remote exec
main.tf
```
resource "aws_instance" "webserver" {
    ami = "ami_id"
    instance_type = "t2.micro"
    
    provisioner "remote-exec" {
        inline = [ "sudo apt update",
                "sudo apt install nginx -y",
                "sudo systemctl enable nginx".
                "sudo systemctl start nginx"
        ]
    }
    connection {
        type = "ssh"
        host = self.public_ip
        user = "ubuntu"
        private_key = file("/root/.ssh/web")
    }
    key_name = aws_key_pair.web.id
    vpc_security_group_ids = [ aws_security_group.ssh-access.id ]
}

resource "aws_security_group" "ssh-access" {
    name = "ssh-access"
    description = "Allow ssh access from the internet"
    ingress {
        from_port = 22
        to_port 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}
```
## local exec -> useful for storing local information
main.tf
```
resource "aws_instance" "webserver" {
    ami = "ami_id"
    instance_type = "t2.micro"
    
    provisioner "local-exec" {
        on_failure = continue
        command = "echo ${aws_instance.webserver.public_ip} >> /tmp/ips.txt"
    }

    provisioner "local-exec" {
        when = destroy
        command = "echo ${aws_instance.webserver.public_ip} Destroyed! >> /tmp/ips.txt"
    }
    connection {
        type = "ssh"
        host = self.public_ip
        user = "ubuntu"
        private_key = file("/root/.ssh/web")
    }
    key_name = aws_key_pair.web.id
    vpc_security_group_ids = [ aws_security_group.ssh-access.id ]
}

resource "aws_security_group" "ssh-access" {
    name = "ssh-access"
    description = "Allow ssh access from the internet"
    ingress {
        from_port = 22
        to_port 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}
```
## provisioner behaviour
* terraform plan has no way managing actions of provisioners
* use provisioners native to resurce like user_data for EC2 or custom_data for azure
* keep post provision tasks to minimum, better to build custom images/image templates instead