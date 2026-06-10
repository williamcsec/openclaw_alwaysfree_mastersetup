#!/usr/bin/env bash
set -e

GREEN='\033[0;32m'
NC='\033[0m'

echo "Configuring systemd service for OpenClaw Docker Compose..."

# Get absolute path to the directory
PROJECT_DIR=$(pwd)

cat <<EOF | sudo tee /etc/systemd/system/openclaw.service
[Unit]
Description=OpenClaw Master Deployment
Requires=docker.service
After=docker.service

[Service]
Type=oneshot
RemainAfterExit=yes
WorkingDirectory=${PROJECT_DIR}
ExecStart=/usr/bin/env docker compose up -d
ExecStop=/usr/bin/env docker compose down
Restart=on-failure
RestartSec=5s

[Install]
WantedBy=multi-user.target
EOF

echo "Reloading systemd daemon..."
sudo systemctl daemon-reload

echo "Enabling OpenClaw service on boot..."
sudo systemctl enable openclaw.service

echo -e "${GREEN}Systemd automation configured successfully.${NC}"
