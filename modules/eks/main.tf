
# Syntax correction
module "eks" {
  source = "terraform-aws-modules/eks/aws"
  version = "20.8.4"

  cluster_name    = var.name
  cluster_version = "1.29"

  # provide vpc and subnet ids
  vpc_id     = var.vpc_id
  subnet_ids = var.subnet_ids

  # allow cluster access via URL
  cluster_endpoint_public_access = true

  # Fetch existing IAM role through arn
  create_iam_role = false
  iam_role_arn    = var.cluster_iam_role_arn

 # t3.small 2 cluster, keeping it simple
 # consumed resources and money, shoudl not be run overnight
  eks_managed_node_groups = {
    hiive-cluster = {
      min_size       = 1
      max_size       = 2
      desired_size   = 1
      instance_types = ["t3.small"]
      iam_role_arn   = var.node_iam_role_arn
    }
  }

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}
