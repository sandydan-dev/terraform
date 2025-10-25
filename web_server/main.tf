#todo: provider like aws, azure, gcp, with region name(code)
provider "aws" {
  region = "ap-south-1" # region name (mumbai now)
}

#todo: Resource block: tak service aws ec2 instance (aws_instance)
resource "aws_instance" "example_instance" {
  ami           = "ami-00af95fa354fdb788" # instance ID
  instance_type = "t3.micro"              # instance type mean, cpu, ram size
  key_name      = "saikey"                # key pair name
  
  user_data = file("shell.sh")         # user data script (shell.sh or script.sh) any
  
  #   vpc_security_group_ids = ["sg-05928599b52c7c429"] # direct ID security group id, create before instance
  vpc_security_group_ids = [aws_security_group.example_sg.id] # its a variable name ID, also define in sg below as it is
  #todo: storeage size in GiB
  root_block_device {
    volume_size = 30
  }

  #todo: aws console name as tag
  tags = {
    Name = "linux_web_http_server" # instance name
  }

}

#todod: Security Group Block (create a new  'security group')
resource "aws_security_group" "example_sg" { # same as it is above SG
  name        = "example_security_sg"        # any name
  description = "Allow SSH and HTTP Access"  # any description

  #todo: inbound rule to allow RDP access  
  ingress { # ingress means INCOMMING  and egress means outgoing
    // port will open between these numbers
    from_port   = 22 # from starting port 
    to_port     = 22 # and ending port   
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # allow RDP from anywhere adjust as needed
  }

  # Allow HTTP (Web Traffic)
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow HTTP"
  }


  #todo: outbond rule to allow all traffic
  egress {
    from_port   = 0             # all port
    to_port     = 0             # allo port
    protocol    = "-1"          # all traffic
    cidr_blocks = ["0.0.0.0/0"] # allow all traffic
  }

}

#todo: Output the public IP of the Instance
output "instance_public_ip" {
  description = "the public ip address of the EC2 instance"
  value       = aws_instance.example_instance.public_ip # this will match with aws instance given name
}

#todo: output the private ip of the instance
output "instance_private_ip" {
  description = "the private id address of the ec2 instance"
  value       = aws_instance.example_instance.private_ip
}