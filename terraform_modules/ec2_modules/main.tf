resource "aws_instance" "example" {
  ami = var.ami_id
  instance_type = var.instance_type
  key_name = "saikey"

  tags = {
    Name = "MyEC2Instance"
  }
}