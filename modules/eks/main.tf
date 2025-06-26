# Simple EKS module to handle underlying configurations with the latest version available

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = var.name
  cluster_version = "1.29"
  subnet_ids      = var.subnet_ids
  vpc_id          = var.vpc_id

  # make cluster accessible via endpoint on local machine. In prod, should probbaly add a VPN or do some type of VPC peering
  cluster_endpoint_public_access = true

  # keep it very simple one node group with max size 2 
  eks_managed_node_groups = {
    hiive-cluster = {
      min_size     = 1
      max_size     = 2
      desired_size = 1

      instance_types = ["t3.small"]

      iam_role_arn = var.node_iam_role_arn
    }
  }

  cluster_iam_role_arn = var.cluster_iam_role_arn

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}
