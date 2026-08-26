# MLOps Local Inference POC

## Ubuntu/Debian

### Step 1: Open terminal
```bash
ctrl + alt + t
```

### Step 2: Download requirements
```bash
sudo apt update && sudo apt install -y git python3 python3-pip docker.io
sudo snap install terraform --classic
sudo usermod -aG docker $USER && newgrp docker
```

### Step 3: Setup everything
```bash
git clone https://github.com/mariocoxen/mlops-ollama-poc.git
cd mlops-ollama-poc
terraform init
terraform apply -auto-approve
```

**Note:** If you don't have an NVIDIA GPU, run:
```bash
terraform apply -var="use_gpu=false" -auto-approve
```

### Step 4: Run and enjoy

**First run (initial setup):**
```bash
docker exec -it local_ollama_poc ollama pull llama3:8b
python3 app.py
```

**Subsequent runs (after container restart):**
```bash
docker exec -it local_ollama_poc ollama run llama3:8b
python3 app.py
```

## Windows 11

### Step 1: Open PowerShell as administrator

### Step 2: Download requirements
```powershell
winget install --id Git.Git -e --source winget
winget install --id Docker.DockerDesktop -e --source winget
winget install --id Hashicorp.Terraform -e --source winget
winget install --id Python.Python.3.11 -e --source winget
```

### Step 3: Setup everything
```bash
git clone https://github.com/mariocoxen/mlops-ollama-poc.git
cd mlops-ollama-poc
terraform init
terraform apply -auto-approve
```

**Note:** For standard office laptops without a dedicated GPU:
```bash
terraform apply -var="use_gpu=false" -auto-approve
```

### Step 4: Run and enjoy

**First run (initial setup):**
```bash
docker exec -it local_ollama_poc ollama pull llama3:8b
python app.py
```

**Subsequent runs (after container restart):**
```bash
docker exec -it local_ollama_poc ollama run llama3:8b
python app.py
```
