# bitnami helm chart
resource "helm_release" "nginx" {
  name       = "nginx"
  namespace  = "default"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "nginx"

  set {
    name  = "service.type"
    value = "LoadBalancer"
  }

  set {
    name  = "replicaCount"
    value = "1"
  }

  # wait until cluster is ready 
  depends_on = [var.cluster_ready]
}
