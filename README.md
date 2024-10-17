<div align="center">
  <br />
      <img src="https://parallelstaff.com/wp-content/smush-webp/2023/12/terraform-1-1536x958.png.webp" alt="Terraform Banner">
  
  <br />

  <h3 align="center">Zoom Clone Infrastructure</h3>
</div>

1. 📊 [Overview](#overview)

This repository is part of a collection of three repositories that follow GitOps principles to deploy a Zoom clone application to an AWS EKS cluster.

The other repositories in this collection are:
- [Application code repository](https://github.com/shadyosama9/Zoom-Clone-App.git)
- [Kubernetes configuration repository](https://github.com/shadyosama9/Zoom-Clone-K8s)


This repository contains Terraform configurations for provisioning the application's infrastructure on AWS. The infrastructure components include:

- **EC2 Instances**
- **Security Groups**
- **VPC (Virtual Private Cloud)**
- **EKS (Elastic Kubernetes Service) Cluster**
- **AWS Load Balancer Ingress Controller**
- **ArgoCD for Continuous Deployment**

The setup utilizes reusable Terraform modules, making it easy to manage and replicate across different environments.