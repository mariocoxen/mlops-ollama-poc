# MLOps Local Inference POC

A proof-of-concept MLOps pipeline provisioning containerized local LLM inference with hardware acceleration via NVIDIA CUDA.

## Stack & Architecture
* Infrastructure as Code: Terraform
* Containerization: Docker Engine with NVIDIA Container Toolkit
* Inference Engine: Ollama (llama3:8b)
* Client API: Python (requests)
* Hardware: NVIDIA GeForce RTX 4060 (Optional fallback to CPU)

## Quick Start

1. **Provision Infrastructure:**
   * **NVIDIA GPU:** `terraform init && terraform apply -auto-approve`
   * **CPU-Only (Laptops):** `terraform init && terraform apply -var="use_gpu=false" -auto-approve`

2. **Pull Model:**
   `docker exec -it local_ollama_poc ollama pull llama3:8b`

3. **Execute API Client:**
   `python3 app.py`
