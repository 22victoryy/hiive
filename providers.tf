provider "aws" {
  region = "ca-central-1"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}
