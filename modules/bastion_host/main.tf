# ./modules/bastion_host/main.tf

variable "vpc_id" {
  description = "ID of the VPC"
}

variable "public_subnet_id" {
  description = "ID of the public subnet"
}

variable "bastion_ami" {
  description = "AMI ID for the bastion host"
}

variable "bastion_instance_type" {
  description = "Instance type for the bastion host"
}

variable "bastion_key_name" {
  description = "SSH key name for the bastion host"
}

variable "security_group_id" {
  description = "ID of the security group for the bastion host"
}

resource "aws_instance" "bastion" {
  ami                    = "ami-0a0f1259dd1c90938"  
  instance_type          = "t2.micro"
  subnet_id              = var.public_subnet_id
  key_name               = "aws-key-pair"
  associate_public_ip_address = true

  security_groups = [var.security_group_id]

  # Other instance configurations

  tags = {
    Name = "Bastion Host"
  }
}

output "bastion_host_public_ip" {
  value = aws_instance.bastion.public_ip
}

output "bastion_host_id" {
  value=aws_instance.bastion.id
}
