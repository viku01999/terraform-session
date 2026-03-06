# Terraform Networking – VPC, Subnets, Security Groups
Goal of Chapter 2

Learn how to create networking resources in AWS using Terraform.

Build a VPC, subnets, internet gateway, and routing.

Attach an EC2 instance to your custom network instead of default VPC.

This is important because real-world infrastructure always runs inside a network, and knowing networking is crucial for Terraform automation.

## 1️⃣ Key Concepts

VPC (Virtual Private Cloud)

A virtual network in AWS.

All AWS resources (EC2, RDS, etc.) run inside a VPC.

Subnet

Segment of VPC IP space.

Public subnet → can assign public IPs.

Private subnet → no direct internet access.

Internet Gateway (IGW)

Allows EC2 instances in public subnets to reach the internet.

Route Table

Directs traffic inside/outside the VPC.

Public subnet → route 0.0.0.0/0 via IGW.

Security Groups (SG)

Firewall for instances.

Chapter 1 covered SSH; now we can add HTTP/HTTPS for web apps.

## 2️⃣ Hands-On Plan

We’ll do the following in Terraform:

Create a VPC (10.0.0.0/16)

Create 1 public subnet (10.0.1.0/24)

Create an Internet Gateway

Attach Route Table to public subnet

Launch EC2 instance inside the public subnet

Update security group to allow SSH + HTTP

All safe for Free Tier.
