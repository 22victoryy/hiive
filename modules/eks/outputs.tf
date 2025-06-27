output "cluster_name" {
  value = module.eks.cluster_name
}

# helm cluster api url 
output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "kubeconfig_certificate_authority_data" {
  value = module.eks.cluster_certificate_authority_data
}

# unique cluster identifier 
output "cluster_id" {
  value = module.eks.cluster_id
}
