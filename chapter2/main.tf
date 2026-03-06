# =========================
# Provider
# =========================
provider "aws" {
  region  = "us-east-2"
  profile = "terraform"
}

# =========================
# VPC
# =========================
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "Chapter2VPC"
  }
}

# =========================
# Public Subnet
# =========================
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-2a"
  tags = {
    Name = "Chapter2PublicSubnet"
  }
}

# =========================
# Internet Gateway
# =========================
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "Chapter2IGW"
  }
}

# =========================
# Route Table
# =========================
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "Chapter2PublicRT"
  }
}

# Associate Route Table with Public Subnet
resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public_rt.id
}

# =========================
# Security Group
# =========================
resource "aws_security_group" "web_sg" {
  name        = "chapter2-web-sg"
  description = "Allow SSH + HTTP"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
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

# =========================
# EC2 Instance in Public Subnet
# =========================
resource "aws_instance" "web_server" {
  ami                    = "ami-06e3c045d79fd65d9" # Ubuntu 24.04 Free Tier
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.public.id
  key_name               = "terraform-key"
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  tags = {
    Name = "Chapter2WebServer"
  }
}

# =========================
# Output Public IP
# =========================
output "web_server_public_ip" {
  value       = aws_instance.web_server.public_ip
  description = "Public IP of the EC2 instance"
}