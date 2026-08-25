import requests

# Define local Ollama API endpoint port
url = "http://localhost:11434/api/generate"

# Construct JSON request payload
payload = {
    "model": "llama3:8b", # Target model pulled in Docker container
    "prompt": "Explain Infrastructure as Code in MLOps in two concise sentences.", # Test prompt
    "stream": False # Return full string response instead of streaming chunks
}

# Send HTTP POST request to local containerized API
response = requests.post(url, json=payload)

# Print output from local AI container
print("\n--- Ollama AI Response ---")
print(response.json()["response"])
