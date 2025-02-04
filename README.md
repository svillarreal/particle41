# Particle41 - TimeService project

## Overview

Particle41 is REST API that serves time built with Node.js, TypeScript and AWS infrastructure (VPC + EKS) written with Terraform.

## Folder Structure

.
├── app/
│ ├── src/
│ ├── test/
│ ├── kubernetes/
│ │ ├── deployment.yaml
│ │ └── service.yaml
│ ├── Dockerfile
│ ├── package.json
│ └── README.md
├── terraform/
│ ├── vars/
│ │ └── dev.tfvars
│ ├── \_main.tf
│ ├── ecr.tf
│ ├── eks.tf
│ ├── outputs.tf
│ ├── vpc.tf
│ ├── variables.tf
│ ├── versions.tf
│ └── README.md
└── README.md

## Repository

```sh
git clone https://github.com/svillarreal/particle41.git
cd particle41
```
