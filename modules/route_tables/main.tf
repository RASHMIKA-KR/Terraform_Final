variable "vpc_id" {
  description = "ID of the VPC"
}

variable "internet_gateway_id" {
  description = "ID of the Internet Gateway"
}

variable "public_subnet_id" {
  description = "ID of the public subnet"
}

variable "private_subnet_id" {
  description = "ID of the private subnet"
}

variable "vpc_cidr_block" {
  description = "CIDR block of the VPC"
}

variable "private_instance_id" {
 description = "The ID of the private instance"
}

resource "aws_route_table" "public" {
  vpc_id = var.vpc_id
}

resource "aws_eip" "nat_gw_eip" {
  instance = null  # Since there's no instance associated with a NAT Gateway
}

resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_gw_eip.id
  subnet_id     = var.private_subnet_id  # Use the ID of the public subnet
}


resource "aws_route_table" "private" {
  vpc_id = var.vpc_id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw.id
  }
}

output "public_route_table_id" {
  value = aws_route_table.public.id
}

output "private_route_table_id" {
  value = aws_route_table.private.id
}

# Associate the public route table with the public subnet
resource "aws_route_table_association" "public_subnet_association" {
  subnet_id      = var.public_subnet_id
  route_table_id = aws_route_table.public.id
}

# Associate the private route table with the private subnet
resource "aws_route_table_association" "private_subnet_association" {
  subnet_id      = var.private_subnet_id
  route_table_id = aws_route_table.private.id
}
