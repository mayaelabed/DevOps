terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.22.0"
    }
  }
}

provider "docker" {}

# Docker network
resource "docker_network" "app_network" {
  name = "app_network"
}

# # Docker image for React frontend
# resource "docker_image" "react_frontend" {
#   name = "react-frontend:latest"
#   build {
#     path = "./frontend" # Ensure this path is relative to the Terraform working directory
#   }
# }

# Docker container for React frontend
resource "docker_container" "react_frontend" {
  name  = "react-frontend"
  image = "mayaelabed/react-frontend:latest"
  networks_advanced {
    name = docker_network.app_network.name
  }
  ports {
    internal = var.frontend_port
    external = var.frontend_port
  }
}

# # Docker image for Node.js backend
# resource "docker_image" "node_backend" {
#   name = "node-backend:latest"
#   build {
#     path = "./backend" # Ensure this path is relative to the Terraform working directory
#   }
# }

# Docker container for Node.js backend
resource "docker_container" "node_backend" {
  name  = "node-backend"
  image = "mayaelabed/node-backend:latest"
  networks_advanced {
    name = docker_network.app_network.name
  }
  ports {
    internal = var.backend_port
    external = var.backend_port
  }
}
