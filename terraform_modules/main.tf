#todo: Main file .tf
provider "aws" {
  region = "ap-south-1"
}

# type module name to get from another location thats why we use module keyword
module "ec2_instance" {
  source = "./ec2_modules" # call modules folder 
  instance_type = "t2.micro"  # overrite the default instance type
}


output "ec2_public_ip" {
  value = module.ec2_instance.instance_public_ip
}