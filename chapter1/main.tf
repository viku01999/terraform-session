# =========================
# Provider Configuration
# =========================
provider "aws" {
  region  = "us-east-2"
  profile = "terraform"  # Must match your AWS CLI profile
}

# =========================
# Security Group (Firewall)
# =========================
resource "aws_security_group" "ssh_sg" {
  name        = "terraform-ssh-sg"
  description = "Allow SSH inbound traffic"
  # If using default VPC, comment this out or define default VPC
  # vpc_id      = aws_vpc.default.id

  # Ingress = incoming traffic
  ingress {
    description = "SSH from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # For learning only; restrict to YOUR_IP in production ["YOUR_IP/32"]  # safer than 0.0.0.0/0
  }

  # Egress = outgoing traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] # Allow all outgoing traffic
  }
}

# =========================
# EC2 Instance
# =========================
resource "aws_instance" "web_server" {
  ami           = "ami-06e3c045d79fd65d9"  # Free-tier Ubuntu 24.04 LTS
  instance_type = "t3.micro"
  key_name      = "terraform-key"          # Must match your AWS key pair name
  vpc_security_group_ids = [aws_security_group.ssh_sg.id]

  tags = {
    Name = "TerraformDemo"
  }
}

# =========================
# Output Public IP
# =========================
output "web_server_public_ip" {
  value       = aws_instance.web_server.public_ip
  description = "Public IP of the EC2 instance"
}