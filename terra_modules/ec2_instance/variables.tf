# ami id
variable "ami_id" {
  default = "ami-<id>"
}

# instance type
variable "instance_type" {
  default = "t2.micro"
}
# key_name
variable "key_name" {
  default = "saikey"
}

# volume size
variable "volume_size" {
  default = 22
}

# tag name
variable "instance_name" {
  default = "myInstance"
}