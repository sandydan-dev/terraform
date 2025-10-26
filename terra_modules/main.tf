provider "aws" {
  region = "ap-south-1"
}

// instance resource with aws ec2 instance
# resource "aws_instance" "example_instance" {
#   ami = var.ami_id
#   instance_type = var.instance_type
#   key_name = var.key_name
#   vpc_security_group_ids = [aws_security_group.example_sg.id]

#   // volume
#   root_block_device {
#     volume_size = var.volume_size
#   }

#   // instance console name
#   tags = {
#     Name = var.volume_size
#   }
# }

// security group
# resource "aws_security_group" "example_sg" {
#   name = "example security group"
#   description = "new security group"

#   // inbond(ingress) rule for ssh all and access
#   ingress {
#     from_port = 22
#     to_port = 22
#     protocol = "tcp"
#     cidr_blocks = var.cidr_blocks
#   }

#   // inbond(ingress) for http
#   ingress {
#     from_port = 80
#     to_port = 80
#     protocol = "tcp"
#     cidr_blocks = var.cidr_blocks
#   }

#   // oubond(egress) http open for all traffic
#   egress {
#     from_port = 0
#     to_port = 0
#     protocol = "-1"
#     cidr_blocks = var.cidr_blocks
#   }
# }


// public ip
# output "instance_public_ip" {
#   description = "example public ip"
#   value = aws_instance.example_instance.public_ip
# }

// private ip
# output "instance_private_ip" {
#   description = "example private ip"
#   value = aws_instance.example_instance.private_ip
# }


#todo: Modules

module "ec2_instance" {
  source = "./ec2_instance"
}

// public ip
output "instance_public_ip" {
  value = module.ec2_instance.instance_public_ip
}

// private ip
output "instance_private_ip" {
  value = module.ec2_instance.instance_private_ip
}