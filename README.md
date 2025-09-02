# 🚀 Deploying a Highly Available 2-Tier Architecture with Terraform

This project demonstrates how to design, build, and deploy a **highly available 2-tier architecture on AWS** using **Terraform** and **Terraform Cloud** as the CI/CD engine.
The solution highlights **Infrastructure as Code (IaC)** best practices, modular design, and environment automation.

---

## 📖 Overview

The goal of this project is to provision a **production-style AWS environment** that includes:

- A **Custom VPC** with public and private subnets across multiple Availability Zones (AZs).
- A **Web Tier** running EC2 instances with a bootstrap script (Apache/NGINX/WordPress depending on tier).
- A **Database Tier** running an RDS MySQL instance in private subnets.
- **Security Groups** with least privilege principles (web traffic only on port 80/443, DB access restricted to web tier).
- **Terraform Cloud** integration for CI/CD deployment pipelines.

This setup follows the **two-tier architecture pattern**, providing **fault tolerance**, **scalability**, and **security**.

---

## 🏗 Architecture

<p align="center">
  <img src="./terraform_2tier_architecture.png" alt="Highly Available 2-Tier Architecture on AWS (Terraform)" />
</p>

> Place `terraform_2tier_architecture.png` in the repo root (or update the image path if you store it under `assets/`).

---

## ⚙️ Tech Stack

- **Terraform** – Infrastructure as Code  
- **Terraform Cloud** – Remote state + CI/CD  
- **AWS VPC** – Custom networking (subnets, route tables, IGW, NAT)  
- **EC2** – Web tier servers (Apache/NGINX/WordPress)  
- **RDS (MySQL)** – Database tier  
- **Application Load Balancer (ALB)** – Distributes traffic across web servers  
- **Security Groups** – Network segmentation and access rules  

---

## 📂 Repository Structure

```plaintext
├── modules/
│   ├── vpc/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── ec2/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── rds/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   └── alb/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
├── main.tf
├── variables.tf
├── outputs.tf
├── provider.tf
├── userdata.sh        # EC2 bootstrap (Apache/WordPress install)
└── README.md
```

---

## 🚀 Deployment Instructions

### 1️⃣ Clone the Repository
```bash
git clone https://github.com/<your-username>/terraform-2tier-architecture.git
cd terraform-2tier-architecture
```

### 2️⃣ Configure AWS Credentials
Set environment variables in **Terraform Cloud** or your local shell:
```bash
export AWS_ACCESS_KEY_ID=<your-access-key>
export AWS_SECRET_ACCESS_KEY=<your-secret-key>
export AWS_DEFAULT_REGION=us-east-1
```

### 3️⃣ Initialize Terraform
```bash
terraform init
```

### 4️⃣ Validate & Plan
```bash
terraform validate
terraform plan
```

### 5️⃣ Apply Infrastructure
```bash
terraform apply -auto-approve
```

### 6️⃣ Destroy Resources (when finished)
```bash
terraform destroy -auto-approve
```

---

## 🔐 Security Considerations

- **Principle of Least Privilege** enforced with Security Groups:
  - Web tier: inbound HTTP/HTTPS only.
  - RDS: accepts connections only from Web tier SG.
- **Private subnets** for database to prevent direct internet exposure.
- **Terraform Cloud** manages sensitive variables (access keys, DB credentials).

---

## 🎯 Advanced & Complex Tiers

- **Advanced:**  
  - Integrated **Application Load Balancer** in front of web servers.  
  - Security Group modifications for ALB ↔ Web tier communication.

- **Complex:**  
  - **WordPress deployment** via EC2 `userdata.sh` bootstrap script.  
  - **WordPress ↔ RDS integration** for persistent, multi-server database backend.  
  - Emphasizes why **RDS** is preferred over local EC2 DB installs (HA, backups, scaling).

---

## 📊 Outputs

After deployment, Terraform will output key values:
- **ALB DNS Name** – public endpoint for web application  
- **RDS Endpoint** – private DB endpoint for WordPress connectivity  

Example:
```plaintext
alb_dns_name = "my-alb-1234567890.us-east-1.elb.amazonaws.com"
rds_endpoint = "mydb.abc123xyz.us-east-1.rds.amazonaws.com"
```

---

## 📚 Lessons Learned

- Importance of **network segmentation** between tiers.  
- **HA design** using multiple AZs ensures uptime.  
- **Terraform Cloud** simplifies team collaboration and remote state management.  
- Using **modules** promotes reusability and maintainability.  
- **RDS vs local DB**: centralized managed database simplifies scaling and improves resilience.

---

## 🔗 Links

- [Terraform AWS Provider Docs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)  
- [WordPress Installation Docs](https://wordpress.org/support/article/how-to-install-wordpress/)  
- [Terraform Cloud](https://app.terraform.io/)  

---

## 📸 Screenshots / Diagrams

Include screenshots of:
- ALB DNS opened in a browser
- RDS console (endpoint + security group)
- Terraform Cloud workspace runs
- Web app landing page (Apache/NGINX/WordPress)

---

## 👨‍💻 Author

**Eric Paul Michael Francis**  
Cloud & DevOps Engineer | AWS | Terraform | CI/CD  
[GitHub](https://github.com/EricpFrancisGIT) • [LinkedIn](https://www.linkedin.com/in/eric-francis-ms/) • [Medium] (https://medium.com/@eric.francis1103)
