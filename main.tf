# run all modules in vpc folder
module "vpc" {
  source             = "./modules/vpc"
  name               = var.cluster_name
  availability_zones = ["ca-central-1a", "ca-central-1b"]
}

# run all modules in security folder
module "security" {
  source = "./modules/security"
  name   = var.cluster_name
}

# run all modules in eks folder
module "eks" {
  source               = "./modules/eks"
  name                 = var.cluster_name
  vpc_id               = module.vpc.vpc_id
  subnet_ids           = module.vpc.public_subnet_ids
  cluster_iam_role_arn = module.security.cluster_iam_role_arn
  node_iam_role_arn    = module.security.node_iam_role_arn
}
