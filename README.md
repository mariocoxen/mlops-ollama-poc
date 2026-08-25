# MLOps Local Inference POC

A proof-of-concept MLOps pipeline provisioning containerized local LLM inference with hardware acceleration via NVIDIA CUDA.

## Stack & Architecture
* Infrastructure as Code: Terraform
* Containerization: Docker Engine with NVIDIA Container Toolkit
* Inference Engine: Ollama (llama3:8b)
* Client API: Python (requests)
* Hardware: NVIDIA GeForce RTX 4060

## Quick Start
1. terraform init && terraform apply -auto-approve
2. docker exec -it local_ollama_poc ollama pull llama3:8b
3. python3 app.py
