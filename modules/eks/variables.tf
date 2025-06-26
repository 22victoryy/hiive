variable "name" {
  description = "EKS cluster name"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID for the cluster"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs"
  type        = list(string)
}

variable "cluster_iam_role_arn" {
  description = "IAM role ARN for EKS control plane"
  type        = string
}

variable "node_iam_role_arn" {
  description = "IAM role ARN for EKS worker nodes"
  type        = string
}
