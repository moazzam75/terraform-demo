provider "aws" {
  region = "ap-south-1"
}

variable "cidr-block" {
  description = "CIDR Block for VPC and Subnet"
  type = list(string)
}

variable avail_zone {}
resource "aws_vpc" "test-vpc" {
  cidr_block = var.cidr-block[0]
  tags = {
    Name = "testing purpose"
  }
}

resource "aws_subnet" "test-subnet" {
  vpc_id = aws_vpc.test-vpc.id
  cidr_block = var.cidr-block[1]
  availability_zone = var.avail_zone
  tags = {
    Name = "test-subnet"
  }
}

