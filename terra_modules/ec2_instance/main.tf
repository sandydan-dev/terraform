resource "aws_instance" "example" {
  ami = var.ami_id # var.ami_id
  instance_type = var.instance_type # var.instance_type
  key_name = var.key_name  # var.key_name

  tags = {
    key_name = var.instance_name  # var.key_name
  }
}