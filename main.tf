terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

provider "docker" {}

# Variable to toggle GPU hardware acceleration (default: true for NVIDIA GPUs)
variable "use_gpu" {
  type        = bool
  default     = true
  description = "Set to false for CPU-only execution on machines without NVIDIA GPUs"
}

# Pull the base Ollama container image
resource "docker_image" "ollama_image" {
  name = "ollama/ollama:latest"
}

# Provision the Ollama container
resource "docker_container" "ollama_container" {
  name  = "local_ollama_poc"
  image = docker_image.ollama_image.image_id

  ports {
    internal = 11434
    external = 11434
  }

  # Dynamically assign GPU passthrough if enabled, otherwise fallback to CPU
  gpus = var.use_gpu ? "all" : null
}
