# MLOps Local Inference POC

ubuntu/debian:
**step#1:** open terminal ctrl + alt + t

**step#2:** download all requirements (with exact steps bellow)
sudo apt update && sudo apt install -y git python3 python3-pip docker.io
sudo snap install terraform --classic
sudo usermod -aG docker $USER && newgrp docker

step#3: setup everything
git clone https://github.com/mariocoxen/mlops-ollama-poc.git
cd mlops-ollama-poc
terraform init
terraform apply -auto-approve (Note: run 'terraform apply -var="use_gpu=false" -auto-approve' if you don't have an NVIDIA GPU)

step#4: run and enjoy project
docker exec -it local_ollama_poc ollama pull llama3:8b
python3 app.py

Windows 11:
step#1: open powershell as administrator
step#2: download requirements
winget install --id Git.Git -e --source winget
winget install --id Docker.DockerDesktop -e --source winget
winget install --id Hashicorp.Terraform -e --source winget
winget install --id Python.Python.3.11 -e --source winget

step#3: setup everything
git clone https://github.com/mariocoxen/mlops-ollama-poc.git
cd mlops-ollama-poc
terraform init
terraform apply -auto-approve (Note: run 'terraform apply -var="use_gpu=false" -auto-approve' for standard office laptops without a dedicated GPU)

step#4: enjoy and run
docker exec -it local_ollama_poc ollama pull llama3:8b
python app.py
