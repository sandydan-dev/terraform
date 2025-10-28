provider "aws" {
  region = "ap-south-1"
}

// create a vpc
resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "MyTerraformVPC"
  }
}

# create a public subnet
resource "aws_subnet" "PublicSubnet" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = "10.0.1.0/24"
}

# create Private subnet
resource "aws_subnet" "PrivateSubnet" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = "10.0.2.0/24"
}

// create IGW
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.myvpc.id
}

// route table for pubc subnet
resource "aws_route_table" "PublicRT" {
  vpc_id = aws_vpc.myvpc.id
  route  {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

// route table asscociation with publick subnet
resource "aws_route_table_association" "PublicRTAssociation" {
  subnet_id      = aws_subnet.PublicSubnet.id   
  route_table_id = aws_route_table.PublicRT.id
}

