# Particle41 - TimeService project

## Overview

Particle41 is REST API that serves time built with Node.js, TypeScript and AWS infrastructure (VPC + EKS) written with Terraform.

## Folder Structure

.
├── .github/
│ └── workflows/
│ └── cicd.yaml
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

## CICD

This app is deployed with a GitHub Actions Workflow, whose definition could be found on `.github/workflows/cicd.yaml`.

This CICD pipeline deploys the Terraform infra in AWS (VPC, EKS, etc) and then Builds and Pushes the TypeScript app to ECR.

## Setup

Follow these docs to get started:

- [Application Setup](app/README.md)
- [Infrastructure Setup](terraform/README.md)
