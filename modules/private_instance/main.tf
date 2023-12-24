# modules/private_instance/variables.tf

variable "private_subnet_id" {
  description = "ID of the private subnet"
}

variable "ami" {
  description = "AMI ID for the EC2 instance"
}

variable "instance_type" {
  description = "Instance type for the EC2 instance"
}
resource "aws_instance" "private_instance" {
  ami           = "ami-0f1b9ed1b81d78f76"
  instance_type = "t2.micro"
  subnet_id     = var.private_subnet_id

  # Other instance configurations

  tags = {
    Name = "Private EC2 Instance"
  }
}

output "private_instance_id" {
  value = aws_instance.private_instance.id
}
