# particle41 - infrastructure

## Description

This doc explains how to set up AWS infrastructure using Terraform, that is, required **variables, IAM permissions, and how to deploy**. This stack provisions AWS infrastructure for a EKS cluster inside a custom VPC using Terraform.

## Terraform State

It is important to note that the Terraform state is stored in S3. Also, the locks are backed by a DynamoDB table (check the `_main.tf` to see more details).

## Key Files

- terraform/vpc.tf
- terraform/eks.tf
- terraform/ecr.tf

## Prerequisites

- **Terraform** >= `1.10.0`
- **AWS CLI** installed
- AWS credentials configured (`aws configure`)

## Load Balancer

Load Balancer is created and managed by Kubernetes. Since we are using a LoadBalancer Service, Kubernetes asks AWS to create the ALB automatically and connects it to our pods. This way, we don't have to configure the ELB ourselves, and Kubernetes takes care of registering the instances, health checks, and routing.

## How to Deploy

```sh

cd terraform

terraform init -reconfigure -backend-config="bucket=terraform-remote-state-particle41-dev" -backend-config="dynamodb_table=terraform-remote-state-lock-particle41-dev" -backend-config="key=particle41/dev/terraform.tfstate"

terraform plan -var-file="vars/dev.tfvars"

terraform apply -var-file="vars/dev.tfvars"
```
