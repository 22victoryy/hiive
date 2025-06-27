output "nginx_status" {
  value = helm_release.nginx.status
}

output "nginx_name" {
  value = helm_release.nginx.name
}
