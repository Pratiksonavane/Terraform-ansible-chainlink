# Terraform-ansible-chainlink

Install terraform

$ wget https://releases.hashicorp.com/terraform/0.12.26/terraform_0.12.26_linux_amd64.zip

$ unzip terraform_0.12.26_linux_amd64.zip

$ sudo mv terraform /usr/local/bin

Install ansible

$ sudo apt install ansible

Install python-boto library

$ sudo apt install python-boto

Clone Terraform-ansible-chainlink

$ git clone https://github.com/Pratiksonavane/Terraform-ansible-chainlink

$ cd terraform-ansible-chainlinkn

add region access key id and secret key id in maint.tf 

        region = ""
        
        access_key = ""
        
        secret_key = ""
        

Dowload pem key in this location

change pem key in main.tf: replace Linux-Frankfurt with your name.pem key

Run terraform 

$ terraform apply







