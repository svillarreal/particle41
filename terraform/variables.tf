variable "project_name" {
  description = "Project Name"
  default     = "particle41"
}
variable "env" {
  type        = string
  description = "Environment in which terraform components will be deployed"
}

variable "region" {
  default     = "us-east-1"
  description = "AWS Region"
}

variable "cidr" {
  default     = "10.0.0.0/16"
  description = "Base VPC CIDR block"
}

variable "azs" {
  default     = ["us-east-1a", "us-east-1b"]
  description = "List of Availability Zones (two per VPC)"
}

variable "private_subnets" {
  type        = list(any)
  description = "List of private subnets blocks (two per VPC)"
}

variable "public_subnets" {
  type        = list(any)
  description = "List of private subnets blocks (two per VPC)"
}
