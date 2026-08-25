terraform {
  required_providers {
    docker = {
      # Docker provider from kreuzwerker
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

# Configure Docker provider connection
provider "docker" {}

# Pull official Ollama Docker image
resource "docker_image" "ollama_image" {
  # Target official Ollama image tag
  name         = "ollama/ollama:latest"
  # Keep image locally upon stack tear-down
  keep_locally = true
}

# Provision container mapped to RTX 4060 GPU
resource "docker_container" "ollama_container" {
  # Assign container name
  name  = "local_ollama_poc"
  # Reference Docker image ID
  image = docker_image.ollama_image.image_id

  # Map host port 11434 to container API port 11434
  ports {
    internal = 11434 # Container default API port
    external = 11434 # Host listening port
  }

  # Pass host GPU devices into container for CUDA acceleration
  gpus = "all"
}
