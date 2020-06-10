#Terraform main config file
        #Defining access keys and region
provider "aws" {
        region = "eu-central-1"
        access_key = ""
        secret_key = ""
}


resource "aws_security_group" "ssh_http_https" {
        name            = "ssh_http_https"
        description     = "For web and ssh access"
        vpc_id          = "vpc-f421f99e" #Default VPC id here

        ingress {  #HTTP Port
                from_port       = 6688
                to_port         = 6688
                protocol        = "tcp"
                cidr_blocks     = ["0.0.0.0/0"]

        }
        ingress {  #SSH Port
                from_port       = 22
                to_port         = 22
                protocol        = "tcp"
                cidr_blocks     = ["0.0.0.0/0"]

        }

        ingress {  #HTTPS Port
                from_port       = 6689
                to_port         = 6689
                protocol        = "tcp"
                cidr_blocks     = ["0.0.0.0/0"]

        }

        egress  {  #Outbound all allow
                from_port       = 0
                to_port         = 0
                protocol        = -1
                cidr_blocks     = ["0.0.0.0/0"]
        }

#        tags {
#                Name    = "ssh_http_https"
#        }

}

resource "aws_instance" "App"{
        ami = "ami-0e342d72b12109f91"  #AMI defined in variables.tf file
        instance_type = "t2.micro"  #Instance type defined in variables.tf file
        key_name = "Linux-Frankfurt" #KeyPair name to be attached to the instance. Forgot to add in variables :D
        vpc_security_group_ids = ["${aws_security_group.ssh_http_https.id}"] 
        provisioner "local-exec" { command = "sleep 20" } 
                #local-exec runs our app server related playbook
         provisioner "local-exec" {
                command ="ansible-playbook -i ec2.py playbook.yml --private-key=Linux-Frankfurt.pem --user ubuntu"
        }

}

