# Update package info
sudo apt update

# Install unzip and curl if not installed
sudo apt install unzip curl -y

# Download AWS CLI v2
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

# Unzip the installer
unzip awscliv2.zip

# Run the installer
sudo ./aws/install

# Verify installation
aws --version

aws configure --profile profile_name

aws configure list-profiles

sudo cat ~/.aws/credentials

sudo cat ~/.aws/config

aws configure --profile terraform remove

# Permission

chmod 400 terraform-key.pem