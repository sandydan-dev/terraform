
# region 
variable "region" {
  description = "AWS region, resource will be created"
  type = string
  default = "ap-south-1"
}

# AMI id
variable "ami_id" {
  description = "AMI id to use for EC2 instance"
  type = string
  default = "ami-00af95fa354fdb788"
}

# instance type for cpu, memory types
variable "instance_type" {
  description = "type of EC2 instance"
  type = string
  default = "t3.micro"
}

# instance key pair, region specific
variable "key_name" {
  description = "Key pair name to access EC2 instance"
  type = string
  default = "saikey"
}

# storage volume size like HDD/SSD
variable "volume_size" {
  description = "storage size in GiB for root volume"
  type = number
  default = 25
}

variable "instance_name" {
  description = "AWS console instance name"
  type = string
  default = "my_linux"
}

variable "cidr" {
    default = "0.0.0.0/0"
}

