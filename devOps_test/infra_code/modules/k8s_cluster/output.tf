output "k8s_endpoint" {
  value = aws_eks_cluster.octopus_app.endpoint
}

output "k8s_certificate" {
  sensitive = true
  value = aws_eks_cluster.octopus_app.certificate_authority[0].data
}

output "k8s_cluster_name" {
  value = aws_eks_cluster.octopus_app.name
}