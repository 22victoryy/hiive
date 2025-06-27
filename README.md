# Hiive EKS Deployment with Terraform 

Local machine requirements: Terraform, AWS CLI, kubectl, Helm (For simplicity, I did not use raw YAML as it gets messy.)

- Provisions an AWS EKS cluster in `ca-central-1`
- Deploy nginx using helm
- Set up required VPC, subnets, IAM roles, and security configuration

## Stack
- Terraform v1.6+
- AWS CLI v2
- `kubectl`
- `helm`


## Modules:
- `vpc`: VPC with two public subnets and internet gateway
- `security`: IAM roles for the EKS control plane and nodes
- `eks`: EKS cluster(1–2 t3.small nodes) and managed node group 
- `helm`: Helm deployment of NGINX 


## 🚀 How to Deploy

terraform init
terraform apply -var-file="terraform.tfvars"
