# Hiive EKS Deployment with Terraform 

Local machine requirements: Terraform, AWS CLI, kubectl. This project provisions a complete EKS cluster in AWS using Terraform and deploys a sample NGINX application.


- Provisions an AWS EKS cluster in `ca-central-1`
- Deploy nginx using helm
- Set up required VPC, subnets, IAM roles, and security configuration
- Deploys **NGINX** using `kubectl` and a simple YAML file
- Uses **Terraform modules** for VPC, IAM, and EKS
- Minimal setup of 1-2 nodes (t3.small). Terraform destroy to not incur further costs.
- Creator access granted via `enable_cluster_creator_admin_permissions = true`for easier take home project access to the nodes. 


## Prerequisites
- Terraform ≥ 1.5
- AWS CLI with valid credentials - I used an IAMRole instead of root account for best practises
- GitHub (public repo required)
- I used raw yaml for deployment and for the purpose of simplicity but for production or complex deployments, HELM would be a better choice.



## Modules:
- `vpc`: VPC with two public subnets and internet gateway
- `security`: IAM roles for the EKS control plane and nodes
- `eks`: EKS cluster(1–2 t3.small nodes) and managed node group 

## How to Deploy

# Clone the repo
git clone https://github.com/yourname/hiive
cd hiive

# Set up AWS credentials
Setup the aws credentials and initialize it on local machine via aws configure
Make sure you are in the right scope via aws sts get-caller-identity

# Initialize Terraform
terraform init

# Review the plan
terraform plan

# Apply the infrastructure
terraform apply


# Nginx deployment
Run a simple yaml.
* Update context to make sure kubectl is in the right scope for the cluster - hiive % aws eks update-kubeconfig \
  --name hiive-simple-eks-cluster \
  --region ca-central-1

* Run deploy raw yaml for nginx - kubectl apply -f deploy-nginx.yaml

* Check your pods - kubectl get pods


## To minimize cost, please run terraform destroy after testing.


# Screenshots and short explanations
* cluster-running-on-aws.png - shows cluster running in ca-central-1
* terraform-successfully-deployed.png - shows full terraform output
* deployed-nginx-running-kubectl.png - shows deployed nginx as pods 
