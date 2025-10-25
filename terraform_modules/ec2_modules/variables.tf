# AMI id
variable "ami_id" {
  description = "the ami id to use for the instance"
  default = "ami-00af95fa354fdb788"
}

variable "instance_type" {
  description = "the instance type, cpu, ram(memory)"
  default = "t2.small"
}