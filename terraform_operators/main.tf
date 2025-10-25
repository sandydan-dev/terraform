
provider "aws" {
  region = "ap-south-1"
}

// varible for instance type  (list)
variable "instance_type" {
  type    = list(string)                          # type of data to add
  default = ["t2.micro", "t2.small", "t2.medium"] # value to allowed string type
  # index     0            1           2
}

# variable instance tag  (map)
variable "instance_tag" {
  type = map(string)
  default = {
    Name        = "SaiDemy"
    Environment = "Development"
    Team        = "DevOps"
  }
}

# loops
variable "instances" {
  type = map(string)
  default = {
    instanceA = "t2.micro"
    instanceB = "t2.small"
    instanceC = "t2.medium"
  }
}

# EC2 instance infrastructure
resource "aws_instance" "example_operator" {
  # 3 loops
  for_each = var.instances   # for each key of instance
  ami      = "ami-00af95fa354fdb788" # ami ID
  #   instance_type          = var.instance_type[1]         # instance type like cpu, memory-ram, based on variable
  instance_type          = each.value  # for each value of the instances variable
  key_name               = "saikey"                           # key pair
  vpc_security_group_ids = [aws_security_group.example_sg.id] # sg variable name

  # storage size HDD/SSD
  root_block_device {
    volume_size = 20
  }

  # AWS ec2 console name
    tags = {
      Name = each.key   # for each key, variable instances
    }

#   tags = var.instance_tag # Operator map 2s
}


# security group create new sg
# resource "aws_security_group" "example_sg" {
#   name        = "example_security_group"
#   description = "Allow ssh and http access"

#   # INBOND : allow ssh to access 
#   ingress {
#     from_port   = 22 # for ssh 
#     to_port     = 22 # for ssh
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"] # allow ssh 
#   }

#   # INBOND: allow http web content from anywhere
#   ingress {
#     from_port   = 80 # allow http
#     to_port     = 80 # allow http
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"] # access content from anywhere
#   }

#   # OUTBOND: rule to allow traffic
#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }


# }


# output for public ip address of the ec2 instance
# output "instance_public_ip" {
#   description = "public ip for ec2 instance"
#   value       = aws_instance.example_operator.public_ip
# }

# # outbond for private ip
# output "instance_private_ip" {
#   description = "public ip for ec2 instance"
#   value       = aws_instance.example_operator.private_ip
# }