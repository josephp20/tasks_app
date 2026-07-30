output "container_name" {
  description = "Name of the created container"
  value       = docker_container.tasks_web.name
}

output "container_id" {
  description = "ID of the created container"
  value       = docker_container.tasks_web.id
}

output "application_url" {
  description = "URL used to access the deployed container"
  value       = "http://localhost:${var.external_port}"
}

output "network_name" {
  description = "Docker network created by Terraform"
  value       = docker_network.tasks_network.name
}

output "volume_name" {
  description = "Docker volume created by Terraform"
  value       = docker_volume.tasks_data.name
}