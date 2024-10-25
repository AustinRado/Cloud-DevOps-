terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "${var.region}"
  profile = "${var.profile}"
}

# Create dev-server instance
resource "aws_instance" "dev-server" {
  ami                         = var.ami-id
  instance_type               = "t2.micro"
  subnet_id                   = "subnet-05e35f643c3231e60"
  vpc_security_group_ids      = ["sg-05d628e6d97860907"]  
  associate_public_ip_address = true
  key_name                    = "DevOps"
  iam_instance_profile        = "ec2multirole"

  tags = {
    Name = "dev-server"
  }
}

# Create prod-server instance
resource "aws_instance" "prod-server" {
  ami                         = var.ami-id
  instance_type               = "t2.micro"
  subnet_id                   = "subnet-05e35f643c3231e60"
  vpc_security_group_ids      = ["sg-05d628e6d97860907"]
  associate_public_ip_address = true
  key_name                    = "DevOps"
  iam_instance_profile        = "ec2multirole"

  tags = {
    Name = "prod-server"
  }
}