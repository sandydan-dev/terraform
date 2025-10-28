provider "aws" {
  region = "ap-south-1"
}


# resource "aws_s3_bucket" "example" {
#   bucket = "my-s3-bucket-0123-${terraform.workspace}"
# }



#todo: Terraform functions

variable "value" {
  type = string
  default = "Hello World"
}

variable "string_list" {
  type =  list(string)
  default = ["server1", "server2", "server3", "server4", "server5"]
}

// upper() function
output "name" {
  value = upper(var.value)
}

// startwith() function
output "startwith_example" {
  value = startswith(var.value, "Hello")
}

// min() function 
output "min_example" {
  value = min(1,2,3,4,5)
}

// max()
output "max_example" {
  value = max(1,2,3,4,5)
}

// abs() : it convert negative to positive
output "abs_example" {
  value = abs(-15.155)
}

// lenght()
output "length_example" {
  value = length(var.value)
}

// join()
output "join_example" {
  value = join(":", var.string_list)
}

// contain()
output "contain_example" {
  value = contains(var.string_list, "server1")
}

// toset()
output "toset_example" {
  value = toset(var.string_list)  // remove duplicate values, it convert list to set
}