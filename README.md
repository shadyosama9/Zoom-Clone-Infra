<div align="center">
  <br />
      <img src="https://parallelstaff.com/wp-content/smush-webp/2023/12/terraform-1-1536x958.png.webp" alt="Terraform Banner">
  
  <br />

  <h3 align="center">Zoom Clone Infrastructure</h3>
</div>

## <a name="overview">📊 Overview</a>

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

---

## <a name="modules">📦 Modules Overview</a>

This repository uses modular Terraform configurations to create AWS infrastructure components in a reusable and scalable way. The primary modules included are for **EC2 instances** and **Security Groups**.

1. **EC2 Instance Module**

    The EC2 instance module is responsible for provisioning Amazon EC2 instances with customizable configurations. It leverages input variables to allow for flexibility in defining the instance's properties. Below are the key features of this module:

    **Instance Configuration**
    - **instance_type**: The type of EC2 instance to be created (e.g., `t2.micro`, `t3.medium`).
    - **ami**: The Amazon Machine Image (AMI) used to launch the instance.
    - **key_name**: The key pair used for SSH access to the instance.
    - **vpc_security_group_ids**: The security groups associated with the instance.
    - **availability_zone**: Specifies the availability zone where the instance will be deployed (e.g., `us-east-1c`).

    **Root Block Device**
    - Configurable options for the volume type and size.
    - Option to delete the volume upon termination of the instance.

    **Tags**
    - Supports adding custom tags to the instance for identification and management.

    **Variables Used**
    - `INSTANCE_TYPE`: Specifies the EC2 instance type.
    - `INSTANCE_TAGS`: A map of tags to associate with the instance.
    - `INSTANCE_SG_ID`: The security group ID to attach to the instance.
    - `KEY_NAME`: Name of the SSH key pair.
    - `INSTANCE_AMI`: The AMI ID to use for the instance.
    - `VOLUME_SIZE`: Size of the root volume.
    - `VOLUME_TYPE`: Type of the root volume.

<br>

2. **Security Groups Module**

    The Security Groups module defines and manages security groups that control inbound and outbound traffic to AWS resources. The module supports dynamic creation of rules based on the input variables, making it highly flexible for different networking needs.

    **Dynamic Rules Configuration**
    - **Ingress Rules**: Allows inbound traffic to specified ports and protocols.
    - **Egress Rules**: Controls outbound traffic from the resources.

    **Dynamic Rule Creation**
    - Supports creating multiple ingress and egress rules for each security group based on the configurations provided in the variable.

    **VPC Association**
    - Each security group is associated with a specific VPC, ensuring that traffic rules are properly applied to resources within that network.

    **Tags**
    - Enables tagging for easier resource management and identification.

    **Variables Used**
    - `ZOOM_SGs`: A map of security group configurations, including:
    - **vpc_id**: The ID of the VPC where the security group will be created.
    - **name**: The name of the security group.
    - **description**: A description of the security group.
    - **ingress** and **egress**: Lists of rules specifying allowed inbound and outbound traffic.
    - **tags**: Tags associated with the security group.

    **Outputs**
    - **Security-Groups-IDs**: Outputs a map of security group IDs created by the module, allowing easy reference for other resources.
---

## <a name="root">📂 Root Directory Overview</a>

The root directory contains Terraform configurations structured to deploy and manage AWS infrastructure, organized into subdirectories to ensure modularity and maintainability. It includes the following components:

## 1. EC2 Sub-Directory
The EC2 sub-directory defines and provisions EC2 instances using reusable modules.

## Key Files in the ec2 Directory

- **`main.tf`**: This file contains the module definitions for creating security groups and EC2 instances (Jenkins and Splunk servers). It uses modules from the `modules` directory to ensure that the configurations are reusable and easy to manage.
  
- **`providers.tf`**: Specifies the AWS provider and the region where the resources will be deployed.

- **`s3.tf`**: Configures an S3 bucket named `zoomclone-eks-bucket`, which is used for the backend to store the state file


- **`vars.tf`**: Contains variable definitions to parameterize the configuration, allowing for flexibility in specifying the security group settings.

- **`terraform.tf`**: Configures the Terraform backend to use an S3 bucket for state management, ensuring that the infrastructure state is stored securely and can be shared among team members.

<br>

## 2. EKS Directory Overview

The eks sub-directory is dedicated to setting up the infrastructure required for an Amazon EKS cluster using Terraform. This directory includes various Terraform configuration files, each serving a specific purpose in defining resources, modules, and provider settings necessary for deploying and managing an EKS environment.

## Key Files in the eks Directory

- **`main.tf`**: This file is the primary configuration for your EKS setup. It utilizes two main modules:

- **`VPC Module`**: Creates a Virtual Private Cloud (VPC) tailored for the EKS cluster, defining CIDR blocks, subnets, and enabling NAT gateways.

- **`EKS Module`**: Configures the EKS cluster itself, specifying parameters like the cluster name, version, node groups, and network settings.

- **`providers.tf`**: Defines the AWS and Helm providers used for managing resources. This includes specifying the AWS region and the configuration required to authenticate and interact with the EKS cluster using the Helm provider.

- **`s3.tf`**: Configures an S3 bucket named `zoomclone-eks-bucket`, which is used for the backend to store the state file

- **`terraform.tf`**: Specifies required providers for Terraform, such as AWS and Helm, along with their respective versions. It also sets up the S3 backend for state management, ensuring that Terraform state is stored in a remote S3 bucket.

- **`eks-addon.tf`**: Configures EKS add-ons, specifically the `vpc-cni` add-on. This is crucial for managing networking in the cluster, enabling features like prefix delegation and pod security group enforcing.

- **`eks-iam-lbcontroller.tf`**: Sets up IAM roles and policies for the AWS Load Balancer Controller. This includes defining the assume role policy and attaching the necessary permissions for the controller to function correctly, such as managing load balancers and security groups.