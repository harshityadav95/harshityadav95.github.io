---
title: Terraform in Azure
author: harshityadav95
date: 2022-08-20 00:00:00 +0530
categories: [Azure]
tags: [Terraform]

---

## Recap to Terraform


{% include embed/youtube.html id='tomUWcQ0P3k' %}


## Terraform Installation

![image](https://github.com/user-attachments/assets/467872bc-84cb-4b79-b30b-38f87d9b5767)


Tried official installation instructions but faced some dependency issue on my machine so ended up installing using the brew recipe 

```xml
brew install terraform 
```

## Getting Started

1. Set up a Cloud Account on any cloud provider ([AWS](https://k21academy.com/amazon-web-services/aws-solutions-architect/create-aws-free-tier-account/), [Azure](https://k21academy.com/microsoft-azure/create-free-microsoft-azure-trial-account/), [OCI](https://k21academy.com/oracle-cloud/video-register-free-oracle-cloud-trial-account/))
2. Install Terraform
3. Add a provider – AWS, Azure, OCI, GCP, or others
4. Write configuration files
5. Initialize Terraform Providers
6. PLAN (DRY RUN) using terraform plan
7. APPLY (Create a Resource) using terraform apply
8. DESTROY (Delete a Resource) using terraform destroy

## Terraform Providers

![image](https://github.com/user-attachments/assets/97ae881f-1382-4182-a480-3c82b7bc0a28)


## Teraform Configuration Files

![image](https://github.com/user-attachments/assets/36cd1d50-3212-4ffa-a463-c5c63b5c78c9)


## Importing Existing Infrastructure

![image](https://github.com/user-attachments/assets/0239ea29-e064-4378-ac2c-3b171a533f0a)


## Terraform Stages

![image](https://github.com/user-attachments/assets/9603a019-f085-4b83-8ddf-9d0dba8493c6)


## Commands

```bash
$ mkdir learn-terraform-azure

$ cd learn-terraform-azure

## Code in the Terraform File

## Az login in between with the correct subscription selected activated

$ terraform init

$ terraform fmt

$ terraform plan

$ terraform apply
```

## Resource :

- [https://formulae.brew.sh/formula/terraform](https://formulae.brew.sh/formula/terraform)
- [https://k21academy.com/terraform-iac/terraform-beginners-guide/](https://k21academy.com/terraform-iac/terraform-beginners-guide/)
- [https://k21academy.com/terraform-iac/terraform-cheat-sheet/](https://k21academy.com/terraform-iac/terraform-cheat-sheet/)
- [Build Infrastructure - Terraform Azure Example Terraform - HashiCorp Learn](https://learn.hashicorp.com/tutorials/terraform/azure-build?in=terraform/azure-get-started)
- [Install Terraform Terraform - HashiCorp Learn](https://learn.hashicorp.com/tutorials/terraform/install-cli)



