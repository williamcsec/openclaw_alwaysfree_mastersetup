#!/usr/bin/env bash
set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo "Generating docker-compose.yml..."

cat <<EOF > docker-compose.yml
version: '3.8'

services:
  openclaw:
    image: node:lts-slim
    container_name: openclaw-master
    restart: unless-stopped
    working_dir: /app
    volumes:
      - .:/app
      - ./configs:/app/configs
      - openclaw-data:/root/.openclaw
    env_file:
      - .env
    command: >
      bash -c "npm install -g openclaw && openclaw start --config /app/configs/openclaw-alwaysfree.json"
    ports:
      - "3000:3000"

volumes:
  openclaw-data:
EOF

echo "Pulling required images..."
docker compose pull || docker-compose pull

echo "Starting OpenClaw service..."
docker compose up -d || docker-compose up -d

echo "Verifying startup..."
sleep 5
if ! docker ps | grep -q "openclaw-master"; then
    echo -e "${YELLOW}Container failed to start, retrying...${NC}"
    docker compose up -d || docker-compose up -d
    sleep 5
    if ! docker ps | grep -q "openclaw-master"; then
        echo "Failed to start OpenClaw."
        exit 1
    fi
fi

echo -e "${GREEN}OpenClaw deployment successful.${NC}"
