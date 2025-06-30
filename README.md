# Hiive EKS Deployment with Terraform 

Local machine requirements: Terraform, AWS CLI, kubectl, Helm (For simplicity, I did not use raw YAML as it gets messy.)

- Provisions an AWS EKS cluster in `ca-central-1`
- Deploy nginx using helm
- Set up required VPC, subnets, IAM roles, and security configuration

## Prerequisites
- Terraform ≥ 1.5
- AWS CLI with valid credentials
- GitHub (public repo required)



## Modules:
- `vpc`: VPC with two public subnets and internet gateway
- `security`: IAM roles for the EKS control plane and nodes
- `eks`: EKS cluster(1–2 t3.small nodes) and managed node group 

## How to Deploy

# Clone the repo
git clone https://github.com/yourname/hiive
cd hiive

# Set up AWS credentials
export AWS_ACCESS_KEY_ID=...
export AWS_SECRET_ACCESS_KEY=...

# Initialize Terraform
terraform init

# Review the plan
terraform plan

# Apply the infrastructure
terraform apply


# Nginx deployment
Run a simple yaml.


To minimize cost, please run terraform destroy after testing.


# Screenshots and short explanations
cluster running on aws.png - shows cluster running in ca-central-1
terraform successfully deployed.png - shows full terraform output
deployed-nginx-running-kubectl.png - shows deployed nginx as pods 
