# MLOps Local Inference POC

A proof-of-concept MLOps pipeline provisioning containerized local LLM inference with hardware acceleration via NVIDIA CUDA.

## Stack & Architecture
* **Infrastructure as Code:** Terraform
* **Containerization:** Docker Engine with NVIDIA Container Toolkit
* **Inference Engine:** Ollama (llama3:8b)
* **Client API:** Python (requests)
* **Hardware:** NVIDIA GeForce RTX 4060 (Optional fallback to CPU)

## Ubuntu Step-by-Step Guide
Follow these steps to deploy the project from scratch on an Ubuntu machine.

### 1. Open Terminal & Clone Repository("CTRL + ALT + T")
git clone https://github.com/mariocoxen/mlops-ollama-poc.git
cd mlops-ollama-poc

### 2. Provision Infrastructure (Terraform)
For NVIDIA GPU Systems:
terraform init
terraform apply -auto-approve

For CPU-Only Systems (No NVIDIA GPU):
terraform init
terraform apply -var="use_gpu=false" -auto-approve

### 3. Load the AI Model
docker exec -it local_ollama_poc ollama pull llama3:8b

### 4. Execute the API Client
python3 app.py
