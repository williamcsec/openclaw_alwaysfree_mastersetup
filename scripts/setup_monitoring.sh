#!/usr/bin/env bash
set -e

GREEN='\033[0;32m'
NC='\033[0m'

echo "Configuring monitoring services..."

mkdir -p scripts

# Create healthcheck script if it doesn't exist
cat <<'EOF' > scripts/health_monitor.sh
#!/usr/bin/env bash
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

# Check Docker Container Status
if ! docker ps | grep -q "openclaw-master"; then
    echo "[$TIMESTAMP] CRITICAL: OpenClaw container is not running." >> /var/log/openclaw_monitor.log
    systemctl restart openclaw.service
else
    echo "[$TIMESTAMP] OK: OpenClaw container is running." >> /var/log/openclaw_monitor.log
fi

# Basic HTTP Healthcheck (assuming port 3000)
if curl -s http://localhost:3000/health > /dev/null; then
    echo "[$TIMESTAMP] OK: OpenClaw API is responding." >> /var/log/openclaw_monitor.log
else
    echo "[$TIMESTAMP] WARNING: OpenClaw API is not responding on port 3000." >> /var/log/openclaw_monitor.log
fi
EOF

chmod +x scripts/health_monitor.sh

# Add to cron if not already added
CRON_JOB="*/5 * * * * $(pwd)/scripts/health_monitor.sh"
(crontab -l 2>/dev/null | grep -v "health_monitor.sh"; echo "$CRON_JOB") | crontab -

echo -e "${GREEN}Monitoring configured successfully. Logs available at /var/log/openclaw_monitor.log${NC}"
