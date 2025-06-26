# Add create EKS I am role
# Allow role assumption so it can use this role for EKS control

resource "aws_iam_role" "eks_cluster_role" {
  name = "${var.name}-eks-cluster-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "eks.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = {
    Name = "${var.name}-eks-cluster-role"
  }
}

# Add IAM managed IAM policy for EKS role
resource "aws_iam_role_policy_attachment" "eks_cluster_AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks_cluster_role.name
}

# EKS worker node role deployment
# Same for EKS main IAM role, allow role assumption when managing nodes 

resource "aws_iam_role" "eks_node_role" {
  name = "${var.name}-eks-node-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = {
    Name = "${var.name}-eks-node-role"
  }
}

# Attacj IAM Policies to EKS worker node role
# EKSWorkerNodePolicy - allows communication between node and control plane.
# ECRReadOnly - allows pulling public/private container images.
# CNI Policy - required for VPC networking via the AWS CNI plugin (https://docs.aws.amazon.com/eks/latest/best-practices/vpc-cni.html) - Pod assigning

resource "aws_iam_role_policy_attachment" "eks_node_AmazonEKSWorkerNodePolicy" {
  role       = aws_iam_role.eks_node_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}

resource "aws_iam_role_policy_attachment" "eks_node_AmazonEC2ContainerRegistryReadOnly" {
  role       = aws_iam_role.eks_node_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}

resource "aws_iam_role_policy_attachment" "eks_node_CNI" {
  role       = aws_iam_role.eks_node_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
}

resource "aws_eks_cluster" "oidc_provider" {
  # placeholder just in case you need OIDC configuration later
  depends_on = [aws_iam_role.eks_cluster_role]
}
