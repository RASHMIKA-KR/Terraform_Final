# modules/private_subnet/main.tf

variable "vpc_id" {
  description = "ID of the VPC"
}
resource "aws_subnet" "private" {
  vpc_id                  = var.vpc_id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "ap-south-1b"

  tags = {
    Name = "Private_Subnet"
  }
}

output "private_subnet_id" {
  value = aws_subnet.private.id
}