// provider must specified for aws we give provider name 'aws'
// Block {}
provider "aws" {        # cloud name like aws, azure, gcp etc.
  region = "ap-south-1" // specifies region, which region want to work
}

// Block {} "resource type"  "resource name"
// define the EC2 instance
resource "aws_instance" "terraform_windows_server" {
  ami                    = "ami-06fa3f12191aa3337"  # ami instance id
  instance_type          = "t3.medium"               # cpu, ram choosing
  key_name               = "saikey"                 # key pair name for authenticate
  vpc_security_group_ids = ["sg-05928599b52c7c429"] # security group id, create before instance

  // sub block {}
  root_block_device {
    volume_size = 30 # Configure storage 
  }

  tags = {
    Name = "MyEC2_Instance" # Instance name tag shown in aws console
  }

}
