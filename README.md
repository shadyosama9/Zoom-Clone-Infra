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

### Instance Configuration
- **instance_type**: The type of EC2 instance to be created (e.g., `t2.micro`, `t3.medium`).
- **ami**: The Amazon Machine Image (AMI) used to launch the instance.
- **key_name**: The key pair used for SSH access to the instance.
- **vpc_security_group_ids**: The security groups associated with the instance.
- **availability_zone**: Specifies the availability zone where the instance will be deployed (e.g., `us-east-1c`).

### Root Block Device
- Configurable options for the volume type and size.
- Option to delete the volume upon termination of the instance.

### Tags
- Supports adding custom tags to the instance for identification and management.

### Variables Used
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

### Dynamic Rules Configuration
- **Ingress Rules**: Allows inbound traffic to specified ports and protocols.
- **Egress Rules**: Controls outbound traffic from the resources.

### Dynamic Rule Creation
- Supports creating multiple ingress and egress rules for each security group based on the configurations provided in the variable.

### VPC Association
- Each security group is associated with a specific VPC, ensuring that traffic rules are properly applied to resources within that network.

### Tags
- Enables tagging for easier resource management and identification.

### Variables Used
- `ZOOM_SGs`: A map of security group configurations, including:
  - **vpc_id**: The ID of the VPC where the security group will be created.
  - **name**: The name of the security group.
  - **description**: A description of the security group.
  - **ingress** and **egress**: Lists of rules specifying allowed inbound and outbound traffic.
  - **tags**: Tags associated with the security group.

### Outputs
- **Security-Groups-IDs**: Outputs a map of security group IDs created by the module, allowing easy reference for other resources.
