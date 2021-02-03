output "vpc" {
  value       = google_compute_network.vpc
  description = "The VPC resource being created"
}

output "vpc_name" {
  value       = google_compute_network.vpc.name
  description = "The name of the VPC being created"
}

output "network_self_link" {
  value       = google_compute_network.vpc.self_link
  description = "The URI of the VPC being created"
}

