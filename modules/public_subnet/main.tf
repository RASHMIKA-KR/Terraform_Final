# modules/public_subnet/main.tf


variable "vpc_id" {
  description = "ID of the VPC"
}

resource "aws_subnet" "public" {
  vpc_id                  = var.vpc_id
  cidr_block              = "10.0.0.0/24"
  availability_zone       = "ap-south-1b"

  tags = {
    Name = "Public_Subnet"
  }
}

output "public_subnet_id" {
  value = aws_subnet.public.id
}
