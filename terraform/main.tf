provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "web" {
  ami           = "ami-024e6efaf93d85776"
  instance_type = "t2.micro"
  key_name      = var.key_name
  tags = {
    Name = "startup-prototype-server"
  }
  security_groups = [aws_security_group.web_sg.name]
}
output "ec2_public_ip" {
  description = "The public IP address of the EC2 instance"
  value       = aws_instance.web.public_ip
}

# Generate random suffix
resource "random_id" "suffix" {
  byte_length = 4
}
resource "aws_security_group" "web_sg" {
  name        = "web-sg-${random_id.suffix.hex}"
  description = "Allow web traffic"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}