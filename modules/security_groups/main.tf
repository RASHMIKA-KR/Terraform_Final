# modules/security_group/main.tf

variable "vpc_id" {
  description = "ID of the VPC"
}

resource "aws_security_group" "web_sg" {
  vpc_id = var.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "web_sg"
  }
}

output "web_sg_id" {
  value = aws_security_group.web_sg.id
}
