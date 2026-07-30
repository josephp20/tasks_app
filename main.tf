terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.30"
    }
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "kubernetes_deployment_v1" "tasks_app" {
  metadata {
    name = "tasks-app-terraform"
    labels = {
      app = "tasks-app-terraform"
    }
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "tasks-app-terraform"
      }
    }

    template {
      metadata {
        labels = {
          app = "tasks-app-terraform"
        }
      }

      spec {
        container {
          name              = "tasks-app"
          image             = "tasks_app:v3"
          image_pull_policy = "Never"
        }
      }
    }
  }
}