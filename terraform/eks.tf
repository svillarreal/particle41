module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.31"

  cluster_name    = "${var.project_name}-eks-${var.env}"
  cluster_version = "1.31"

  cluster_endpoint_public_access = true

  enable_cluster_creator_admin_permissions = true

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  eks_managed_node_groups = {
    default = {
      name = "default"

      min_size     = 1
      max_size     = 2
      desired_size = 1

      instance_types = ["t3.small"]
      capacity_type  = "ON_DEMAND"

      create_iam_role = true

      iam_role_additional_policies = {
        "AmazonEC2ContainerRegistryReadOnly" = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
        "AmazonEKSWorkerNodePolicy"          = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
        "AmazonEKS_CNI_Policy"               = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
      }

    }
  }

  tags = {
    Terraform   = "true"
    Environment = var.env
    RepoName    = var.project_name
  }
}
