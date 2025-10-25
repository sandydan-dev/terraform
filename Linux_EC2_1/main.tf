# provider name like cloud provider aws, azure, gcp
provider "aws" {
  region = "ap-south-1" # region in specific (mumbai)
}

// EC2 instance resource intrastructure
resource "aws_instance" "amazon_linux" {
  ami           = "ami-00af95fa354fdb788"
  instance_type = "t3.micro"
  key_name      = "saikey"
  # user_data to run web server
  user_data = file("shell.sh")

  vpc_security_group_ids = [aws_security_group.example_sg.id] // variable name for SG

  # storage capacity
  root_block_device {
    volume_size = 25
  }

  tags = {
    Name = "linux_server"
  }

}


# Security Group block (create new security group)
resource "aws_security_group" "example_sg" {
  name        = "example_security_group"
  description = "Allow ssh and access http"


  # inbond rule to allow ssh and access
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # allow ssh from anywhere 
  }

  # inbond  rule set for http to access web content
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # allow http server from anywhere
  }

  # outbond rule to allow http traffic
  egress {
    from_port   = 0             # all port
    to_port     = 0             # allo port
    protocol    = "-1"          # all traffic
    cidr_blocks = ["0.0.0.0/0"] # allow all traffic
  }

}

// output the public ip of the instance
output "instance_public_ip" {
  description = "public ip address of the instance"
  value       = aws_instance.amazon_linux.public_ip
}


# output the private ip of the instance
output "instance_private_ip" {
  description = "private ip of the instance"
  value       = aws_instance.amazon_linux.private_ip
}