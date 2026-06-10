#!/usr/bin/env bash
set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo "Checking for Docker installation..."

if ! command -v docker &> /dev/null; then
    echo -e "${YELLOW}Docker not found. Installing Docker...${NC}"
    curl -fsSL https://get.docker.com -o get-docker.sh
    sh get-docker.sh
    rm get-docker.sh
    echo -e "${GREEN}Docker installed successfully.${NC}"
else
    echo -e "${GREEN}Docker is already installed.${NC}"
fi

echo "Checking for Docker Compose..."
if ! docker compose version &> /dev/null && ! docker-compose --version &> /dev/null; then
    echo -e "${YELLOW}Docker Compose not found. Installing Docker Compose plugin...${NC}"
    apt-get update -qq
    apt-get install -qq -y docker-compose-plugin
    echo -e "${GREEN}Docker Compose installed successfully.${NC}"
else
    echo -e "${GREEN}Docker Compose is already installed.${NC}"
fi

echo "Enabling and starting Docker service..."
systemctl enable docker
systemctl start docker

echo "Validating Docker installation..."
docker info > /dev/null || { echo "Docker is not running or accessible."; exit 1; }

echo -e "${GREEN}Docker setup complete.${NC}"
