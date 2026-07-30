terraform {
  required_version = ">= 1.5.0"

  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 4.5"
    }
  }
}

provider "docker" {}

resource "docker_network" "tasks_network" {
  name   = var.network_name
  driver = "bridge"
}

resource "docker_volume" "tasks_data" {
  name = var.volume_name
}

resource "docker_image" "web_image" {
  name         = var.image_name
  keep_locally = false
}

resource "docker_container" "tasks_web" {
  name  = var.container_name
  image = docker_image.web_image.image_id

  restart = "unless-stopped"

  networks_advanced {
    name = docker_network.tasks_network.name
  }

  volumes {
    volume_name    = docker_volume.tasks_data.name
    container_path = "/usr/share/nginx/html"
  }

  ports {
    internal = 80
    external = var.external_port
  }

  labels {
    label = "project"
    value = "tasks-app-iac"
  }

  labels {
    label = "managed-by"
    value = "terraform"
  }
}