terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.16"
    }
    tls= {
      source="hashicorp/tls"
      version = "~> 4.0"
    }
  }
  required_version = ">= 1.2.0"
}

provider "aws" { 
  region = "us-east-1"
  shared_credentials_files = ["~/.aws/credentials"]
}


# generate ssh key pair
resource "tls_private_key" "minecraft" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "minecraft_key" {
  key_name   = "minecraft-terraform-key"
  public_key = tls_private_key.minecraft.public_key_openssh
}

# security group
resource "aws_security_group" "minecraft_sg" {
  name        = "minecraft_sg"
  description = "Allow SSH and Minecraft"
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }
  ingress {
    description = "Minecraft"
    from_port   = 25565
    to_port     = 25565
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

resource "aws_instance" "app_server" {
  ami = "ami-0c2b8ca1dad447f8a"
  instance_type = "t2.micro"
  key_name               = aws_key_pair.minecraft_key.key_name
  vpc_security_group_ids = [aws_security_group.minecraft_sg.id]
 
  tags = {
    Name="MCServerInstance"
  }
} 

# output ip and private key file
output "instance_ip" {
  value = aws_instance.app_server.public_ip
}

output "private_key_pem" {
  value     = tls_private_key.minecraft.private_key_pem
  sensitive = true
}

# auto generate inventory file
resource "local_file" "ansible_inventory" {
  content = <<EOF
[minecraft]
${aws_instance.app_server.public_ip} ansible_user=ec2-user ansible_ssh_private_key_file=~/.minecraft-key.pem
EOF

  filename = "${path.module}/inventory"
}
