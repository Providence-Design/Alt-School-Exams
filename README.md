# SwiftRoute AI – Intelligent Logistics 🚚

A complete DevOps & Cloud Engineering project to showcase infrastructure provisioning, CI/CD automation, and a dynamic frontend with a functional contact form.


## 📌 Project Overview

SwiftRoute AI is a cloud-based prototype logistics platform that demonstrates:

* AWS provisioning using Terraform
* CI/CD automation via GitHub Actions
* A dynamic HTML page styled with Tailwind CSS
* A working Node.js backend for form submissions


## 🌐 Live Demo

**Visit**: [http://18.222.76.182](http://18.222.76.182)
**Visit**: [https://swiftroute-ai.duckdns.org/](https://swiftroute-ai.duckdns.org/)

📸 Screenshot of the deployed app:
![alt tag](https://raw.githubusercontent.com/Providence-Design/Alt-School-Exams/main/assets/page.png)


## 🔧 Tech Stack

* **Cloud**: AWS EC2
* **Infrastructure as Code**: Terraform
* **CI/CD**: GitHub Actions
* **Web Server**: Nginx (reverse proxy)
* **App Server**: Node.js (Express)
* **Frontend**: HTML5 + Tailwind CSS



## 📁 Project Structure

```
.
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
├── webapp/
│   ├── index.html
│   ├── server.js
│   ├── contact.js
│   └── profile.jpg
├── .github/
│   └── workflows/
│       ├── terraform.yml
│       └── deploy-app.yml
```



## 🚀 Deployment Instructions

### 1. 🔐 Setup GitHub Secrets

In your repo settings, add the following:

* `AWS_ACCESS_KEY_ID`
* `AWS_SECRET_ACCESS_KEY`
* `EC2_SSH_KEY` (your private key in base64 format)
* `EC2_USER` (e.g., `ubuntu`)
* `EC2_HOST` (your EC2 Public IP)

### 2. 🏗 Provision Infrastructure

Automatically triggered when you push to `terraform/`:

```bash
git add terraform/* && git commit -m "provision infra" && git push
```

This runs Terraform from `.github/workflows/terraform.yml`

### 3. 🚀 Deploy Application

Automatically triggered when you push to `webapp/`:

```bash
git add webapp/* && git commit -m "deploy app" && git push
```

This copies HTML + Node.js files and starts the backend app.

### 4. 🖥️ SSH into the EC2 Instance & Serve HTML Manually

If Nginx default page appears, move your app files manually:

```bash
ssh -i terraform-user.pem ubuntu@EC2_HOST

# Move HTML files to the default Nginx root
sudo mv /home/ubuntu/webapp/* /var/www/html/

# Set proper permissions
sudo chmod -R 755 /var/www/html/

# Restart Nginx to reflect changes
sudo systemctl restart nginx
```

After this, visiting [http://EC2_HOST](http://EC2_HOST) should show your SwiftRoute AI app.

### 5. 🔒 (Optional) Secure with HTTPS Using Certbot + DuckDNS

If you're using a DuckDNS domain (e.g., `swiftroute-ai.duckdns.org`), follow these steps:

```bash
# Install Certbot and Nginx plugin
sudo apt update
sudo apt install -y certbot python3-certbot-nginx

# Issue a certificate for your DuckDNS domain
sudo certbot --nginx -d swiftroute-ai.duckdns.org

# Test HTTPS and auto-renewal
sudo certbot renew --dry-run
```

📌 Make sure port 80 is open and your domain points to the EC2 public IP.



## 📜 Features

* [x] Infrastructure provisioning with Terraform
* [x] Reverse proxy with Nginx to Node.js
* [x] Tailwind-based responsive design
* [x] Working contact form with `/contact` POST handler
* [x] CI/CD integration with GitHub Actions
* [x] Static asset deployment including profile image
* [x] Optional HTTPS via Certbot & DuckDNS


## 👤 Author

**Providence Annor Asemah**
Lead Cloud & DevOps Engineer

* 3+ years in DevOps and Cloud Infrastructure
* Skilled in AWS, GCP, Kubernetes, Docker, Terraform
* BSc in Computer Science, University of Cape Coast

📧 Email: [providence@example.com](mailto:baabaprovidence@gmail.com)
🐙 GitHub: [@Providence-Design](https://github.com/Providence-Design)
