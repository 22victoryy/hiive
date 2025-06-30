# specify terraform version and providers 
terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.40"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.12"
    }
  }
}


provider "aws" {
  region = "ca-central-1"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}
