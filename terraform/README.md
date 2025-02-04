# particle41 - infrastructure

## Description

This doc explains how to set up AWS infrastructure using Terraform, that is, required **variables, IAM permissions, and how to deploy**. This stack provisions AWS infrastructure for a EKS cluster inside a custom VPC using Terraform.

## Key Files

- terraform/vpc.tf
- terraform/eks.tf
- terraform/ecr.tf

## Prerequisites

- **Terraform** >= `1.10.0`
- **AWS CLI** installed
- AWS credentials configured (`aws configure`)

## How to Deploy

```sh

cd terraform

terraform init -reconfigure -backend-config="bucket=terraform-remote-state-particle41-dev" -backend-config="dynamodb_table=terraform-remote-state-lock-particle41-dev" -backend-config="key=particle41/dev/terraform.tfstate"

terraform plan -var-file="vars/dev.tfvars"

terraform apply -var-file="vars/dev.tfvars"
```
