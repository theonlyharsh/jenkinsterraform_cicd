provider "aws" {
  region = "eu-west-1"
}
resource "aws_vpc" "name" {
    cidr_block = "10.0.0.0/24"
    tags = {
    "name" = "terraformvpc"
    }
  }
resource "aws_subnet" "name" {
    vpc_id = aws_vpc.name.id
    cidr_block = "10.0.0.0/28"
    tags = {
      "name" = "terraformsubnet"
    }
}
resource "aws_internet_gateway" "name" {
    vpc_id = aws_vpc.name.id
    tags = {
      "name" = "terraformigw"
    } 
}
resource "aws_instance" "name" {
    ami = "ami-0a89fa9a6d8c7ad98"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.name.id
    tags = {
      "name" = "terraforminstance"
    }
}
