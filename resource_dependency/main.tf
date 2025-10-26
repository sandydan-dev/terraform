# provider "aws" {
#   region = "ap-south-1"
# }
#todo: Dependencies
// bucket 1 create first
// order-1
# resource "aws_s3_bucket" "bucket1" {
#   bucket = "sai-primary-bucket"
# }

// then bucket 2 create, cause it depends on bucket 1
// order-2
# resource "aws_s3_bucket" "bucket2" {
#   bucket = "sai-secondary-bucket"
#   depends_on = [ aws_s3_bucket.bucket1 ]  # Explicit dependency
# }

# first create primary bucket, then it will create seconday bucket, cause it secondary bucket depends on primary bucket, and it will create orderwise automatically


#todo: Life cycle or resources

# resource "aws_s3_bucket" "example1" {
#   bucket = "sai-bucket-20251026"

# #   life cycle resource
#   lifecycle {
#     create_before_destroy = true  # create a new bucket before destroying the old one
#     prevent_destroy       = false # false a  allow the bucket to be a destroy if needed(resource not destroy)
#     ignore_changes        = [tags]
#   }

#   tags = {
#     Name        = "mys3bucket2"
#     Evinornment = "Production"
#   }

# }



#todo: Validations  (precondition and postcondition) inside the lifecycle block

# resource "aws_security_group" "main" {
#   name        = "example.sg"
#   description = "example security group"
# }

# resource "aws_instance" "example" {
#   ami           = "ami-00af95fa354fdb788"
#   instance_type = "t2.small"
#   key_name      = "saikey"

#   # lifecycle block with precodiition and postcondition
#   lifecycle {
#     // check before create resource
#     precondition {
#       condition     = aws_security_group.main.id != ""
#       error_message = "Security group id must not be blank"
#     }

#     // check after resource create
#     postcondition {
#       condition     = self.public_ip != ""
#       error_message = "Public ip is not present"
#     }
#   }

#   tags = {
#     Name = "ExampleInstance"
#   }
# }


#todo: import resource which is graphical, so import resource under the control of the terraform

resource "aws_s3_bucket" "my_bucket" {
  bucket = "sandy-devops-012345"   # replace with your actual s2 buket name only
}