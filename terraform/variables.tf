variable "container_name" {
  description = "Name of the Docker container"
  type        = string
  default     = "tasks-app-iac"
}

variable "image_name" {
  description = "Docker image used by the container"
  type        = string
  default     = "nginx:alpine"
}

variable "network_name" {
  description = "Name of the Docker network"
  type        = string
  default     = "tasks-app-network"
}

variable "volume_name" {
  description = "Name of the persistent Docker volume"
  type        = string
  default     = "tasks-app-data"
}

variable "external_port" {
  description = "External port used to access the application"
  type        = number
  default     = 8085

  validation {
    condition     = var.external_port >= 1024 && var.external_port <= 65535
    error_message = "The external port must be between 1024 and 65535."
  }
}