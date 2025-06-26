# hiive
Hiive tf assignment

providers for all the configs where terraform init will be run in root 

# structure
Modules

EKS
- EKS cluster 
- Managed node groups
- EKS ODIC Provider (open id connect to allow Kubeneretes to use AWS))

* Create the EKS cluster
* Attach the cluster and node IAM roles
* Use your VPC + subnets
* Create a basic managed node group

Security 
- IAM Role for EKS Deployment
- Security group - Control plane and EKS nodes

* I created separate IAM roles for the EKS control plane and worker nodes, each with the least privilege required to operate. AWS-managed policies were used to simplify access control while staying aligned with best practices.

VPC
- Public/Private subnets and route tables 
  * Used 10.0.0.0/16 for baseline classic inter domain routing to get enough ~65k ips to work with
- Internet NAT Gateway
- VPC 




Local machine requirements: Terraform, AWS CLI, kubectl, Helm