# modules/vpc/main.tf

resource "aws_vpc" "my_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "VPC"
  }
}

resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "Internet Gateway"
  }
}

output "vpc_id" {
  value = aws_vpc.my_vpc.id
}

output "internet_gateway_id" {
  value = aws_internet_gateway.my_igw.id
}
