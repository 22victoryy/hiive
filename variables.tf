variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "hiive-simple-eks-cluster"
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "ca-central-1"
}
