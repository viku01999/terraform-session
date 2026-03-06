1- Terraform always follows 4 steps:

2- Write Code: Define resources in .tf files.

```bash
#Initialize: Download required providers.

terraform init

# Plan: See what changes Terraform will make.

terraform plan

# Apply: Execute and create infrastructure.

terraform apply

# Destroy: Delete all resources when done.

terraform destroy

# Public IP
terraform output

# This will display all attributes of your EC2 instance, including:
# Instance ID
# Public IP
# Subnet ID
# Security Groups
terraform show

```