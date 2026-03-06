# Terraform Learning Roadmap

This repository tracks my progress learning Terraform from **beginner to pro**, with chapters, exercises, and hands-on practice.  

---

## 📖 Chapters Overview

### **Chapter 1 – Terraform Basics & EC2**
**Status:** ✅ Completed  
- Install Terraform on Ubuntu  
- Configure AWS CLI & Terraform profile  
- Create a **T3.micro EC2 instance** (Free Tier)  
- Setup **SSH security group**  
- Output instance **public IP**  
- Learn Terraform workflow: `init → plan → apply → destroy`  
- Create `.gitignore` for Terraform files  
- Notes: Avoid AMI changes unless needed (forces instance replacement)

---

### **Chapter 2 – Networking: VPC, Subnets, IGW**
**Status:** 🟡 In Progress  
- Create a **VPC** (`10.0.0.0/16`)  
- Add **Public Subnet** (`10.0.1.0/24`)  
- Attach **Internet Gateway**  
- Create **Route Table** and associate with public subnet  
- Launch EC2 in custom subnet  
- Update **security group** for SSH + HTTP  
- Output EC2 **public IP**  

---

### **Chapter 3 – Web Hosting & Infrastructure as Code**
**Planned**  
- Install Apache / Nginx on EC2  
- Serve a sample HTML page  
- Add **user_data** in Terraform for automated provisioning  
- Learn **immutable vs mutable infrastructure**  

---

### **Chapter 4 – Terraform Variables & Modules**
**Planned**  
- Learn **input variables** for dynamic configuration  
- Use **output variables** for reusability  
- Create **modules** for EC2, VPC, and Security Groups  

---

### **Chapter 5 – Remote State & Workspaces**
**Planned**  
- Store Terraform state in **S3 backend**  
- Use **locking with DynamoDB**  
- Explore **Terraform workspaces** for multiple environments  

---

### **Chapter 6 – Advanced Resources & Scaling**
**Planned**  
- Auto Scaling Groups (ASG)  
- Load Balancers (ALB/ELB)  
- Multi-tier applications (Web + DB)  
- Terraform **lifecycle rules** & resource dependencies  

---

### ⚡ Tips for Safe Learning
- Always check `terraform plan` before `apply`  
- Use **Free Tier AMIs** to avoid charges  
- Destroy resources after experiments: `terraform destroy`  
- Keep `.gitignore` updated to avoid pushing sensitive info  

---

### 🗂 Folder Structure

```text
terraform/
├─ chapter1/
│  ├─ main.tf
│  ├─ terraform-key.pem
│  └─ .gitignore
├─ chapter2/
│  └─ chapter2.tf
├─ README.md