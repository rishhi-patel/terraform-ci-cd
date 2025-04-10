# Terraform CI/CD Pipeline with GitHub Actions – Practical Lab 10

## 🎯 Objective

This project demonstrates setting up a **CI/CD pipeline for Terraform** using **GitHub Actions**. The pipeline automates the provisioning and destruction of AWS EC2 instances using Infrastructure as Code (IaC) principles.

---

## ✅ Features

- Automatically runs `terraform init`, `validate`, `plan`, and `apply` on push to `main`
- Secure AWS credential management using GitHub Secrets
- Manual trigger for `terraform destroy`
- Remote state management using AWS S3 backend (for consistent apply/destroy across CI jobs)

---

## 📁 Project Structure

terraform-ci-cd/
├── main.tf # Defines AWS provider, EC2 instance, AMI lookup
├── variables.tf # Variables for core and thread count
└── .github/
└── workflows/
└── .github/workflows/terraform.yml # GitHub Actions workflow

---

## 🚀 CI/CD Workflow

### Triggered On:

- Push to `main`
- Pull requests to `main`
- Manual workflow dispatch (via GitHub UI)

### Workflow Jobs:

1. **Terraform Init & Plan**
2. **Terraform Apply** _(only on push to `main`)_
3. **Terraform Destroy** _(manual trigger)_

---

## 🔐 GitHub Secrets (Required)

| Secret Name             | Description                      |
| ----------------------- | -------------------------------- |
| `AWS_ACCESS_KEY_ID`     | Your AWS IAM user's access key   |
| `AWS_SECRET_ACCESS_KEY` | Your AWS IAM user's secret key   |
| `AWS_SESSION_TOKEN`     | (Optional) Temporary session key |

---

## 📦 AWS Resources Created

- **EC2 Instance**: Based on the latest Amazon Linux 2 AMI
- **Tags**: Includes student name, ID, and lab info

---

## 🧪 Usage

### 1. Clone the repo

```bash
git clone https://github.com/rishhi-patel/terraform-ci-cd.git
cd terraform-ci-cd
```

### 2. Add GitHub Secrets

- Go to Repository > Settings > Secrets and variables > Actions
  Add your AWS credentials.

### 3. Push changes to trigger the pipeline

### 4. Trigger destroy manually

- Go to Actions tab > Workflow > Run workflow to clean up EC2 resources.

⸻

### 👨‍💻 Created By

Rishi Kumar Patel
Student ID: 8972657
Course: Practical Lab 10 – Terraform CI/CD
