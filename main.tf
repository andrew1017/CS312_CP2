terraform {
  required_proiders {
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  required_version = ">= 1.2.0"
}

provider "aws" { 
  region = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami = "ami-0c2b8ca1dad447f8a"
  instance_type = "t2.micro"
 
  tags = {
    Name="MCServerInstance"
  }
} 
