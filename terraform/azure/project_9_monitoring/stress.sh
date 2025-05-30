# Install stress tool
sudo apt update
sudo apt install -y stress-ng

# Generate high CPU load
stress-ng --cpu-load 90 --cpu 0 --timeout 300s